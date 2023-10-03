# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=5.3
pkgrel=1
pkgdesc="A plant monitoring application that reads and plots data from compatible Bluetooth sensors like Xiaomi 'Flower Care' or Parrot 'Flower Power'"
url="https://github.com/emericg/WatchFlower"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-quickcontrols2" "qt6-connectivity" "qt6-charts" "qt6-svg" "qt6-shadertools" "qt6-5compat")
makedepends=("qt6-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.tar.gz")
sha256sums=('6d1817400b9446f69be16451629b8415e9f148f394b0e77e9f19aaf50fa75c8f')

build() {
  cd "WatchFlower-${pkgver}"
  qmake6 -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  make DESTDIR="${pkgdir}" install
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/watchflower
}
