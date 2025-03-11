# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-math8
pkgver=8.1.1
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="General purpose math library for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
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
conflicts=("${_pkgbase}")   # Ruby bindings are unversioned and conflicts (ruby/gz/math.so)
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('0455b24069c61172b625c55348f3a722652058262422019176d0ff43551f7093')

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
