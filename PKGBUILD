# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui10
pkgver=10.1.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=7'
  'gz-math=9'
  'gz-msgs=12'
  'gz-plugin=4'
  'gz-rendering=10'
  'gz-transport=15'
  'gz-utils=4'
  'protobuf'
  'qt6-base'
  'qt6-charts'
  'qt6-declarative'
  'qt6-5compat'  # Needed for Qt5Compat.GraphicalEffects
  'qt6-location'
  'qt6-declarative'
  'tinyxml2'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  'vulkan-headers'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('cd315b50c2080a112d6d75c9df6b7e7dfcffe7ddd27f186084075a2dc17414f4')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
}

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
