# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.13.1.1
pkgrel=13
pkgdesc="Metapackage for HeidiSQL - wrapper script (install heidisql-qt6 or heidisql-gtk2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
depends=(heidisql-client)

package() {
  # Create wrapper script that prefers GTK2, falls back to Qt6
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/heidisql" << 'EOF'
#!/bin/bash
# Prefer GTK2, fallback to Qt6
if [ -x /usr/bin/heidisql-gtk2 ]; then
    exec /usr/bin/heidisql-gtk2 "$@"
elif [ -x /usr/bin/heidisql-qt6 ]; then
    exec /usr/bin/heidisql-qt6 "$@"
else
    echo "Error: No HeidiSQL variant found. Please install heidisql-gtk2 or heidisql-qt6." >&2
    exit 1
fi
EOF
  chmod +x "${pkgdir}/usr/bin/heidisql"
}
