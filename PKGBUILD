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
source=("$pkgname::git+https://framagit.org/RZHSSNZDH/gganjoorand.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/ganjoorand"
  cp -a ganjoorand "$pkgdir/usr/share/ganjoorand/"
  install -Dm644 ganjoorand.py \
    "$pkgdir/usr/share/ganjoorand/ganjoorand.py"

  rm -rf "$pkgdir/usr/share/ganjoorand/ganjoorand/__pycache__"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/ganjoorand" <<'EOF'
#!/bin/sh
exec python3 /usr/share/ganjoorand/ganjoorand.py "$@"
EOF

  install -Dm644 io.frama.rzhssnzdh.gganjoorand.desktop \
    "$pkgdir/usr/share/applications/io.frama.rzhssnzdh.gganjoorand.desktop"

  install -Dm644 ganjoorand/io.frama.rzhssnzdh.gganjoorand.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.frama.rzhssnzdh.gganjoorand.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
