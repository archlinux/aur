# Maintainer: Gregor Kaelin <kaelingre at gmail dot com>
pkgname=xeus3
pkgver=3.2.0
pkgrel=2
pkgdesc="C++ implementation of the Jupyter kernel protocol - Legacy version 3.2"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('openssl' 'crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepends=('cmake' 'zeromq' 'cppzmq')
conflicts=('xeus')
provides=('xeus=3.2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz")
sha256sums=('c0bf95e0cc58c083c99f49cdbf84fc60a1c03bed89d2cd63c10697ae8c87d1d1')
options=(staticlibs !debug)

build() {
  cd "xeus-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "xeus-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
