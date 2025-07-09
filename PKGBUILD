# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-launch6
pkgver=6.2.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Run and manage programs and plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=5'
  'gz-gui=7'
  'gz-math=7'
  'gz-msgs=9'
  'gz-plugin=2'
  'gz-sim=7'
  'gz-transport=12'
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
sha256sums=('3d8190d5fccf086e84b9064a327e855fa91299dda9e7b5bcfa416c15facec5ba')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
