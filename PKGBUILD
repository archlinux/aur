# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=4.0
pkgrel=1
pkgdesc="WatchFlower is a plant monitoring application that reads and plots data from compatible Bluetooth sensors like Xiaomi 'Flower Care' or Parrot 'Flower Power'!"
arch=("x86_64" "i686")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-quickcontrols2" "qt5-graphicaleffects" "qt6-connectivity" "qt6-charts" "qt6-svg")
makedepends=("qt6-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.tar.gz")
sha256sums=('9a204d047f0e1f87286e466bf5f5ec4e5ad2a03b6c51d70873d524cc0a43144b')

build() {
  mkdir -p "WatchFlower-${pkgver}"
  cd "WatchFlower-${pkgver}"
  qmake6 -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  make DESTDIR="${pkgdir}" install
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/watchflower
}
