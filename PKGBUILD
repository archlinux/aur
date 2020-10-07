# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit
pkgdesc="A VTE-based, simple and froggy terminal emulator"
pkgver=3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kermit/archive/${pkgver}.tar.gz")
sha256sums=('b6f629a45ceee1b081d4cbfd28c525e687e621ddbbd3313c0ad8230f768a9c37')

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
}
