# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-utils2
pkgver=2.1.0
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
  'pkg-config'
  'gz-cmake=3'
  'doxygen'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('667d5000ff02ea332e6d4aa9fba1e31b2d3d153e69d40693918a8bb44330ca57')

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
