# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-utils2
pkgver=2.2.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Classes and functions for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=('cli11')
makedepends=(
  'cmake'
  'gz-cmake=3'
  'doxygen'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('15846369999e1269ab4dcb2f9fd2b4acdd162a69ae40a3f1cd3889437173d3aa')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DGZ_UTILS_VENDOR_CLI11=false \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
