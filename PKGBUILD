# Maintainer: رضا حسین‌زاده <rezahosseinzadeh@riseup.net>
pkgname=ganjoorand
pkgver=0.0.6
pkgrel=1
pkgdesc="A GTK 4 client for a random poem from Ganjoor"
arch=('any')
url="https://framagit.org/RZHSSNZDH/gganjoorand"
license=('GPL3')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject')
makedepends=('git')
source=("$pkgname::git+https://framagit.org/RZHSSNZDH/gganjoorand.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/ganjoorand"
  cp -r ganjoorand "$pkgdir/usr/share/ganjoorand/"
  install -m 644 ganjoorand.py "$pkgdir/usr/share/ganjoorand/"
  rm -rf "$pkgdir/usr/share/ganjoorand/ganjoorand/__pycache__"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/ganjoorand" <<'EOF'
#!/bin/sh
exec python3 /usr/share/ganjoorand/ganjoorand.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/ganjoorand"

  install -d "$pkgdir/usr/share/applications"
  install -m 644 io.frama.rzhssnzdh.gganjoorand.desktop \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m 644 ganjoorand/io.frama.rzhssnzdh.gganjoorand.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
