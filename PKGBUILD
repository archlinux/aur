# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui8
pkgver=8.0.0
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
  'gz-transport=13'
  'gz-rendering=8'
  'gz-msgs=10'
  'qt5-base'
  'qt5-quickcontrols2'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'vulkan-headers'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('4bb54ca7259fc312b6891d7054f04a3d8b89b150ffb31fb2fe50c717e20feac8')

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
