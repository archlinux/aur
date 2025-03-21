# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.2.5
pkgrel=1
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake>=3.16' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}.tar.gz::${url}/-/archive/v${pkgver}/thermalmonitor-v${pkgver}.tar.gz")
sha256sums=('01f6c53592550ad40cc3caabbd036d8c440c581387ba2066fc4fadc0aece9c85')
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
