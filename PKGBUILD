# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui7
pkgver=7.2.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'protobuf'
  'tinyxml2'
  'gz-utils=2'
  'gz-math=7'
  'gz-common=5'
  'gz-plugin=2'
  'gz-transport=12'
  'gz-rendering=7'
  'gz-msgs=9'
  'qt5-base'
  'qt5-quickcontrols2'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('15047e78012dcedb90af431d8b893c035146e6301ce02a40a47ffff0a90e2261')

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
