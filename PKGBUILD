# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui8
pkgver=8.3.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'gz-common=5'
  'gz-math=7'
  'gz-msgs=10'
  'gz-plugin=2'
  'gz-rendering=8'
  'gz-transport=13'
  'gz-utils=2'
  'protobuf'
  'qt5-base'
  'qt5-charts'
  'qt5-declarative'
  'qt5-graphicaleffects'
  'qt5-location'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'tinyxml2'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'vulkan-headers'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('d2d6b1557c574c6774c53893c9cbaa8e2b85eed0bf515e36cd46b3f6a43bfc02')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
