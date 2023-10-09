# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-launch6
pkgver=6.1.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Run and manage programs and plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
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
sha256sums=('ad5356c23b58487f15367a0a60680b3a557b0fb235014e2cb579c49699fc63ed')

build() {
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/ffmpeg4.4/pkgconfig"
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
