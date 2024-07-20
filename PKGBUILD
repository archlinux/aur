# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=sdformat13
pkgver=13.8.0
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
sha256sums=('4ac462c149d178f128a63a69604aca1b973e3e8cf0863f3d84225dae3c912ef9')

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
