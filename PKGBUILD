# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sensors9
pkgver=9.1.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Provides numerous sensor models designed to generate realistic data from simulation environments."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=6'
  'gz-math=8'
  'gz-msgs=11'
  'gz-rendering=9'
  'gz-transport=14'
  'protobuf'
  'sdformat=15'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('b3c016f0af242b8bba3a24a630acde21d37c298a8f20b39a308582ea315fc12a')

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
