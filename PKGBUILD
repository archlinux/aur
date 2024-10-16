# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui9
pkgver=9.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'gz-common=6'
  'gz-math=8'
  'gz-msgs=11'
  'gz-plugin=3'
  'gz-rendering=9'
  'gz-transport=14'
  'gz-utils=3'
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
  'gz-cmake=4'
  'vulkan-headers'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('9c953875c8b2dedc39d6ca824d5d837f8eace6bc492192a085c42b30799c33b2')

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
