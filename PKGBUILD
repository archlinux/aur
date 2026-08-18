# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim10
pkgver=10.5.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Open source robotics simulator"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-common=7'
  'gz-fuel-tools=11'
  'gz-gui=10'
  'gz-math=9'
  'gz-msgs=12'
  'gz-physics=9'
  'gz-plugin=4'
  'gz-rendering=10'
  'gz-sensors=10'
  'gz-transport=15'
  'gz-utils=4'
  'protobuf'
  'qt6-base'
  'qt6-declarative'
  'sdformat=16'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  'pybind11'
  'python'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('48fa00274bf822a780771df5dc07c14ea449cfba732fb9ef9bdff833ae4920b7')

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
