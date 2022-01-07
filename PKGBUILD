# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=3.2
pkgrel=1
pkgdesc="WatchFlower is a plant monitoring application that reads and plots data from compatible Bluetooth sensors like Xiaomi 'Flower Care' or Parrot 'Flower Power'!"
arch=("x86_64" "i686")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-declarative" "qt5-quickcontrols2" "qt5-graphicaleffects" "qt5-connectivity" "qt5-charts" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.tar.gz")
sha256sums=('fdfd5c5bf18a4a10f34d60b41d238521c766f834234784fd3a086fbb1192c465')

build() {
  mkdir -p "WatchFlower-${pkgver}"
  cd "WatchFlower-${pkgver}"
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  make DESTDIR="${pkgdir}" install
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/watchflower
}
