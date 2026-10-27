pkgname=xeus6
pkgver=6.0.6
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
sha256sums=('2cf58d5466a541f7acf668e3500507ca54eb2393780ba3743d94308c24d6ca80')
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
