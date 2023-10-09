# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim8
pkgver=8.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Open source robotics simulator"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'eigen'
  'gz-common=5'
  'gz-fuel-tools=9'
  'gz-gui=8'
  'gz-math=7'
  'gz-msgs=10'
  'gz-physics=7'
  'gz-plugin=2'
  'gz-rendering=8'
  'gz-sensors=8'
  'gz-transport=13'
  'gz-utils=2'
  'protobuf'
  'qt5-base'
  'qt5-quickcontrols2'
  'sdformat=14'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pybind11'
  'python'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('c6298a9d03b9a6e5badd1a78a3b178201e9efac2209bbc2fe5a6b6bbba85125c')

build() {
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/ffmpeg4.4/pkgconfig"
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
