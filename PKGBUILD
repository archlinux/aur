pkgname=xeus6
pkgver=6.1.0
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
sha256sums=('93162d215a70d1ebd85d97bfea0e5f482ac4140d6de8d05990540a2f385021ab')
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
