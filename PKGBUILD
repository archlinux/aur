# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-fuel-tools9
pkgver=9.1.0
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
  'gz-msgs=10'
  'gz-utils=2'
  'jsoncpp'
  'libyaml'
  'libzip'
  'protobuf'
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
sha256sums=('7f5b4139754c8474e6964dfccc7dd3dcd29537773ff97ab676c24563d0e5bc27')

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
