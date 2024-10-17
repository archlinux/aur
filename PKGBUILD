# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-utils3
pkgver=3.0.0
pkgrel=2
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
sha256sums=('abb2b9a108c3b752091ddd5b559c0d86f061636e85f24bd547ae91d1554debbf')

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
