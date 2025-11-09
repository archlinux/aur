# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui9
pkgver=9.0.2
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
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
sha256sums=('8241c31c7ef3668b286426de4103b83ef4c29509c02910b02af9bb6f9e93cec7')

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
