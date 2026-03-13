# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.4.0
pkgrel=1
pkgdesc="Live synced lyrics in your terminal"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('GPL3')
depends=('python' 'playerctl')
optdepends=('python-pillow: for dynamic album art colors')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vlensys/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fca2034939d8eec005191f2e84ff61c0999b57751191921824c7b92a9897e43')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 lyricspot.py "$pkgdir/usr/lib/lyricspot/lyricspot.py"
  install -Dm644 colorthief.py "$pkgdir/usr/lib/lyricspot/colorthief.py"

  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/lyricspot" <<'LAUNCHER'
#!/bin/bash
exec python3 /usr/lib/lyricspot/lyricspot.py "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/lyricspot"
}
