# Maintainer: Dux Labs <DuxLabsDev at gmail dot com>

pkgname=dux-icons
pkgver=0.2.0
pkgrel=1
pkgdesc='Icon theme generator that follows your Material colors'
arch=(any)
url="https://github.com/duxlabs-dev/$pkgname"
license=(MIT Apache-2.0)
depends=(hicolor-icon-theme
         python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c7c1ab7e3e3677dbd12835e97928e317a36c59553ad4ce364a242ee66e6a9f13')

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
