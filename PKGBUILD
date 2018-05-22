# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.1
pkgrel=1
pkgdesc="WatchFlower helps you read and plot datas from your Xiaomi 'Flower Care' devices!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg" "sqlite")
makedepends=("qt5-tools")
source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('3330da0fa3c9eaeb028990c654a8e4b4fcd80979c7d1b637c11f479bdc2261fe')

build() {
  mkdir -p "WatchFlower-${pkgver}"
  cd "WatchFlower-${pkgver}"

  # 0.1 hacks
  mkdir -p bin/
  touch bin/watchflower
  chmod a-x assets/app/watchflower.desktop
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  chmod a+x bin/watchflower # 0.1 hacks
  make install
}

