# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim9
pkgver=9.5.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Open source robotics simulator"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-common=6'
  'gz-fuel-tools=10'
  'gz-gui=9'
  'gz-math=8'
  'gz-msgs=11'
  'gz-physics=8'
  'gz-plugin=3'
  'gz-rendering=9'
  'gz-sensors=9'
  'gz-transport=14'
  'gz-utils=3'
  'protobuf'
  'qt5-base'
  'qt5-quickcontrols2'
  'sdformat=15'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  'pybind11'
  'python'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('668790df2284d6feb8451e0272bbfe1a79cb8c477bd8da709c0d79a70ca9ddee')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
