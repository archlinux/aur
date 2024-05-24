# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-cmake3
pkgver=3.5.3
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
sha256sums=('6b44c3b3f6e9ec4ba7a03838a2fc1b481169aef4bf39a9d8b1633e41f8ef1ae1')

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
