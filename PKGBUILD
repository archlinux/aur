# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=sdformat15
pkgver=15.1.1
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
  'gz-math=8'
  'gz-utils=3'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  'pybind11'
  'python'
  'ruby'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('9c9b517b390fe6965f76775db67f406b42948ebac433f87fadc680467d45184a')

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
