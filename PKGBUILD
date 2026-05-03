# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-math7
pkgver=7.6.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="General purpose math library for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-utils=2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pybind11'
  'python'
  'ruby'
  'swig'
  )
provides=("${_pkgbase}=${_pkgmaj}")
conflicts=("${_pkgbase}")  # Ruby bindings are unversioned and conflicts (ruby/gz/math.so)
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('eafa01f7956f25846814dc56219cbe396c3cd23ac04f0364333bcd3aa6f0d83d')

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
