# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-math8
pkgver=8.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="General purpose math library for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'eigen'
  'gz-utils=3'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  'pybind11'
  'python'
  'ruby'
  'swig'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('a78962f329eea0dd70268ca1c196bc28729f1857ec7cd79cacc0ab1269f55b79')

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
