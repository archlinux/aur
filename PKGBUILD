# Maintainer: Dux Labs <DuxLabsDev at gmail dot com>

pkgname=dux-icons
pkgver=0.1.3
pkgrel=1
pkgdesc='Icon theme generator that follows your Material colors'
arch=(any)
url="https://github.com/duxlabs-dev/$pkgname"
license=(MIT Apache-2.0)
depends=(hicolor-icon-theme
         python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('072432876c98fbbdb9d9cf7c0ad268b2af31e7201fe9963156779931a4d43095')

check() {
  cd "$pkgname-$pkgver"
  python -m unittest
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  sed -i '1s|^#!/usr/bin/env python3|#!/usr/bin/python3|' \
    "$pkgdir/usr/share/$pkgname/scripts/build.py"
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
}
