# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-plugin2
pkgver=2.0.2
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
  'pkg-config'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('678ef78860469b421f6eb8856aacaa21ce00cc88578609a2a4d6d7c8c700b21e')

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
