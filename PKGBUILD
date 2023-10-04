# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sensors7
pkgver=7.3.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Provides numerous sensor models designed to generate realistic data from simulation environments."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'gz-common=5'
  'gz-math=7'
  'gz-msgs=9'
  'gz-rendering=7'
  'gz-transport=12'
  'protobuf'
  'sdformat=13'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pkg-config'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('91d6d72fc110f77374f211af0edc8c3d4a0fc355969aba76b789afcbd1328930')

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
