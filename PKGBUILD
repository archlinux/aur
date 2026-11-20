pkgname=xeus6
pkgver=6.2.1
pkgrel=1
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('openssl' 'crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepends=('cmake' 'zeromq' 'cppzmq')
provides=("xeus=${pkgver}")
conflicts=('xeus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz")
sha256sums=('c2d41b0bbbe1a726a0a504a69992e8a72d8133758a29a8071a8291b2abdb3dbc')
options=(staticlibs)

build() {
  cd "xeus-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build .
  cmake --build build
}

package() {
  cd "xeus-$pkgver"
  DESTDIR="${pkgdir}" cmake --build build --target install
}
