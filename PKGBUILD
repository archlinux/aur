# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.3.0
pkgrel=1
pkgdesc="Live synced lyrics in your terminal"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('GPL3')
depends=('python' 'playerctl')
optdepends=('python-pillow: for dynamic album art colors')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vlensys/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('069bcbf0252a8202adc1aa472377ac66dbc001abf0d6553a5eda5e63f92149f0')

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
