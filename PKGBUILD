# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-fuel-tools8
pkgver=8.1.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="A client library and command line tools for interacting with Gazebo Fuel servers. "
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'curl'
  'gz-common=5'
  'gz-math=7'
  'gz-msgs=9'
  'gz-utils=2'
  'jsoncpp'
  'libyaml'
  'libzip'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
optdepends=(
  'ruby'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('1a5585a8139ddef1f86ae9e70951319f41c046cb51c47cdfe8cfa7b6353bd12a')

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
