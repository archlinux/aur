# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-utils4
pkgver=4.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Classes and functions for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=('cli11' 'spdlog')
makedepends=(
  'cmake'
  'gz-cmake=5'
  'doxygen'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('b06a179ea4297be8b8d09ea7a5d3d45059a3e4030c1bd256afc62f997cc992ed')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DGZ_UTILS_VENDOR_CLI11=false \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
