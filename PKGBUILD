# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim7
pkgver=7.9.0
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
  'gz-fuel-tools=8'
  'gz-gui=7'
  'gz-math=7'
  'gz-msgs=9'
  'gz-physics=6'
  'gz-plugin=2'
  'gz-rendering=7'
  'gz-sensors=7'
  'gz-transport=12'
  'gz-utils=2'
  'protobuf'
  'qt5-base'
  'qt5-quickcontrols2'
  'sdformat=13'
  'tinyxml2'
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
sha256sums=('e3577d9dba2a711f41362fee67c9320e702a5a055b7d0172fe9245c5ecf4f83f')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
