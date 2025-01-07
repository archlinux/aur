# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-cmake4
pkgver=4.1.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="A set of CMake modules that are used by the C++-based Gazebo projects."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
makedepends=('cmake' 'doxygen')
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('6e0078f266f7c4a52c9d24977e7c131c23d37fc9bd2df85bde25c141cb604bf2')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
