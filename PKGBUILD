# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit
pkgdesc="A VTE-based, simple and froggy terminal emulator"
pkgver=3.8
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7b2ad85f73bccee4f6d890693afae2002ca2c51965b83c42e1ca4f4d980468c8')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../.config/$pkgname.conf" -t "$pkgdir/usr/share/$pkgname/examples"
}
