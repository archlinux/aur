# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-fuel-tools10
pkgver=10.0.1
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="A client library and command line tools for interacting with Gazebo Fuel servers. "
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'curl'
  'gz-common=6'
  'gz-math=8'
  'gz-msgs=11'
  'gz-utils=3'
  'jsoncpp'
  'libyaml'
  'libzip'
  'protobuf'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  )
optdepends=(
  'ruby'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('839df226983a6e7be6458b3de63032557d64bf390258541107eb443e02c4aef9')

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
