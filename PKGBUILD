# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-tools2
pkgver=2.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Command line tools for the Gazebo libraries"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=()
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pkg-config'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('5e3788d5a1d5fa40724f1484cda716e0c050f01d2c516efa9f8a00877e74ef64')

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
