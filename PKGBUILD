# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit
pkgdesc="A VTE-based, simple and froggy terminal emulator"
pkgver=3.5
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kermit/archive/${pkgver}.tar.gz")
sha256sums=('c0b0244841eed396ba445ccd377c9d1941d9e12300228b0129d7fc587615751e')

build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "../man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "../.config/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 "../.config/$pkgname.conf" -t "$pkgdir/usr/share/$pkgname/examples"
}
