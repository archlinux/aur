# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.2.6
pkgrel=1
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake>=3.16' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}.tar.gz::${url}/-/archive/v${pkgver}/thermalmonitor-v${pkgver}.tar.gz")
sha256sums=('b609d718e1cf066bff17a629e20494bb7a6d8f9179f05b44b67a55bf0ccc1497')
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
