# Maintainer: Marco Scopesi <marco dot scopesi at gmail dot com>
pkgname=xeus2
pkgver=2.4.1
pkgrel=2
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepends=('cmake' 'cppzmq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz")
conflicts=('xeus')
options=(staticlibs)

build() {
  ln -s xeus-"$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
sha256sums=('601de51df29f9c1953a466909ec584244c171879436cea0a580c1bf99142c654')
