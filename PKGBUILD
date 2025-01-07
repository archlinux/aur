# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=sdformat14
pkgver=14.6.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Simulation Description Format (SDFormat) parser and description files."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'tinyxml2'
  'urdfdom'
  'gz-math=7'
  'gz-utils=2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pybind11'
  'python'
  'ruby'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('6257e8923162148e30e54b6f796b47552b60b621837dd8d3bac4eca309e65e71')

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
