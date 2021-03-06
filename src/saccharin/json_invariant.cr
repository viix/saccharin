# invariant: Hash

macro invariant_hash_key(hash, key, exception_class = "InvalidArgumentError")
  unless {{ hash.id }}[{{ key }}]?
    raise {{ exception_class.id }}.new(message: "{{ key.id }} is missing")
  end
end

macro invariant_hash_key_any(hash, keys, exception_class = "InvalidArgumentError")
  unless {{ keys.id }}.any? { |d| {{ hash.id }}[d]? }
    raise {{ exception_class.id }}.new(message: "one of { {{ keys.join(", ").id }} } must be set")
  end
end

macro invariant_hash_key_all(hash, keys, exception_class = "InvalidArgumentError")
  unless {{ keys.id }}.all? { |d| {{ hash.id }}[d]? }
    raise {{ exception_class.id }}.new(message: "all of { {{ keys.join(", ").id }} } must be set")
  end
end


# invariant: JSON

macro invariant_json_as_h(json, exception_class = "InvalidArgumentError")
  unless {{ json.id }}.as_h?
    raise {{ exception_class.id }}.new(message: "JSON is not hash")
  end
end
