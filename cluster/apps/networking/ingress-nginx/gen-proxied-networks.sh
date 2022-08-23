#!/usr/bin/env sh

FILENAME="proxied-networks.txt"

# Add custom proxy netorks
cat custom-proxied-networks.txt > "${FILENAME}"
echo "" >> "${FILENAME}"

# Add cloudflares IPv4 proxy networks
curl --silent https://www.cloudflare.com/ips-v4 >> "${FILENAME}"
echo "" >> "${FILENAME}"

# Add cloudflares IPv6 proxy networks
curl --silent https://www.cloudflare.com/ips-v6 >> "${FILENAME}"

# Remove emtpy line
sed -i '/^$/d' "${FILENAME}"

# Make into a comma separated list (with escaped commas)
sed -i 'H;1h;$!d;x;y/\n/,/' "${FILENAME}"

# Escape commas
sed -i 's/,/\\,/g' "${FILENAME}"

# Add line ending
echo "" >> "${FILENAME}"
