# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim8
pkgver=8.10.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Open source robotics simulator"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
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
sha256sums=('54e2f285df84c63f11fcb9875d8b570c621237242c5a17aa116b131d0b2262f8')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
}

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
