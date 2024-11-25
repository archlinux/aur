# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.2.2
pkgrel=1
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake>=3.16' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}.tar.gz::${url}/-/archive/v${pkgver}/thermalmonitor-v${pkgver}.tar.gz")
b2sums=('fab9e5c8926c585ebd30fc2735f0986ed2aaad31b29aa93e9955ffce98764f4d8daf3f8fa041bdd8a80e7e058ea1cd40f8acb3fc74af521f2799eb2b595a9e10')
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
