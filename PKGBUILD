# Maintainer: Greg Land <landjgregory at gmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>
pkgname=xeus
pkgver=2.4.1
pkgrel=1
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepends=('cmake' 'zeromq' 'cppzmq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz")
sha256sums=('4d567444fd0cbe9774d8e6480470728aa076c8acc9348dd3b2cd20d9142835ee')
options=(staticlibs)

build() {
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
