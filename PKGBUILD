# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit
pkgdesc="A VTE-based, simple and froggy terminal emulator"
pkgver=3.7
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b45d3403de4c1feb158a468c6067b27f14b99873041113233afb9dce75846ecd')

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
