# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sensors10
pkgver=10.1.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Provides numerous sensor models designed to generate realistic data from simulation environments."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=7'
  'gz-math=9'
  'gz-msgs=12'
  'gz-rendering=10'
  'gz-transport=15'
  'protobuf'
  'sdformat=16'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('52a74fbac457a3fc2a8bd90fc5737632fb4d6fbe6f65987cb95150dbde02223b')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
