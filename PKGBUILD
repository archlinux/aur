# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-utils3
pkgver=3.1.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Classes and functions for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=('cli11' 'spdlog')
makedepends=(
  'cmake'
  'gz-cmake=4'
  'doxygen'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('f7af72b1524f4192e7b7d7aea50ab2ba27b31ef46f4e6be4f6be5a9b0a2bbf21')

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
