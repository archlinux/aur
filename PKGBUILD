# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-plugin2
pkgver=2.0.3
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Cross-platform C++ library for dynamically loading plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'glibc'
  'gz-utils=2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('3b5910b896462f15b9f58babc894c8ade3d37674c24a1db82bca5c0e6e16a41a')

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
