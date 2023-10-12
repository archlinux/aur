# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim7
pkgver=7.6.0
pkgrel=2
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
sha256sums=('872c08cb3cefe4b865daa3454256ba16ac993339bcad4a620930fbb51392c5e3')

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
