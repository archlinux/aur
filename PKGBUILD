# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sensors8
pkgver=8.2.1
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
  'gz-msgs=10'
  'gz-rendering=8'
  'gz-transport=13'
  'protobuf'
  'sdformat=14'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('46885090bd3d1bc43ac5574a0ee204c33c15179fe3026b28b8caa4d12eb63de8')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
