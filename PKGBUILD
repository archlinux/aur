# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.2.3
pkgrel=1
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake>=3.16' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}.tar.gz::${url}/-/archive/v${pkgver}/thermalmonitor-v${pkgver}.tar.gz")
b2sums=('94ae783c351d004038e9a6dab596e4f58f556a4da43aa5357aba2098f32e82d211a389a88390f1be0ff057054f3fc0d9b7d54fd38b6476917f7f55d3c3ac2b0b')
_srcdir="thermalmonitor-v${pkgver}"

build() {
  cd ${_srcdir}
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_DEFAULT_MAJOR_VERSION=6
  # this does nothing for now
  cmake --build build
}

package() {
  cd ${_srcdir}
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
}
