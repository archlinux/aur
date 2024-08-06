# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-launch7
pkgver=7.1.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Run and manage programs and plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'gz-common=5'
  'gz-gui=8'
  'gz-math=7'
  'gz-msgs=10'
  'gz-plugin=2'
  'gz-sim=8'
  'gz-transport=13'
  'gz-utils=2'
  'qt5-base'
  'qt5-quickcontrols2'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'libwebsockets'
  )
optdepends=(
  'libwebsockets: a websocket server for simulation'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('627eab6312836dc90f3adbd70a63c37badf5b1dc982573b80657de5e8453de81')

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
