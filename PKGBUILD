# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=plasma6-applets-thermal-monitor-git
_pkgname=${pkgname%-git}
pkgver=0.1.3.r3.g6133642
pkgrel=2
pkgdesc="A KDE Plasmoid for displaying system temperatures. Latest commit."
arch=(any)
url="https://invent.kde.org/olib/thermalmonitor"
license=("MIT")
depends=(
  plasma-workspace
  ksystemstats
  libksysguard
  kitemmodels
  kdeclarative
)
makedepends=(cmake extra-cmake-modules git)
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_DEFAULT_MAJOR_VERSION=6
  # this does nothing for now
  cmake --build build
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
}
