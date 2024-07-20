# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim8
pkgver=8.5.0
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
sha256sums=('17085b61a1dd18e98f63eadbf0ebf0264fb7b308021d8248c578c8b88716323e')

build() {
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/ffmpeg4.4/pkgconfig"
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
