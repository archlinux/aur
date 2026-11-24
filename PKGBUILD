# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=6.0
pkgrel=2
pkgdesc="A plant monitoring application that reads and plots data from compatible Bluetooth sensors like Xiaomi 'Flower Care' or Parrot 'Flower Power'"
url="https://github.com/emericg/WatchFlower"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-svg" "qt6-graphs" "qt6-connectivity" qt6-positioning)
makedepends=("cmake" "qt6-tools" "qt6-shadertools")

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/emericg/WatchFlower/archive/v${pkgver}.tar.gz")
sha256sums=('ff625b4e1af71e385e8b6ce7adab15369cde06682ed8ad1377751cbed2767446')

build() {
  cd "WatchFlower-${pkgver}"
  cmake -B build/ -DCMAKE_BUILD_TYPE=Release
  cmake --build build/ --config Release
}

package() {
  cd "WatchFlower-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build --prefix /usr/
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/WatchFlower
}
