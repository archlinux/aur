# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.1.7
pkgrel=4
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative')
makedepends=('cmake>=3.16' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}.tar.gz::${url}/-/archive/v${pkgver}/thermalmonitor-v${pkgver}.tar.gz")
b2sums=('6cf986903bc9962f4def3f04d6ebcc07526a1ab65c3ec1f26b1e68e99d5b432d1a4ba45135fb1171c1819a7df07eeaee9bb77596d49d85de532c8a1c7947f6ea')
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
