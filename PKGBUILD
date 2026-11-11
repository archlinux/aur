pkgname=xeus6
pkgver=6.2.0
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
sha256sums=('9bf8ccd9eb71f2bc7192201c8f5ce09be25a38623b47f161f61c2a6db4e90031')
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
