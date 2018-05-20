# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.2.0
pkgrel=1
pkgdesc="An open source clone of Tetris Attack based on SDL"
arch=('i686' 'x86_64')
url="http://www.blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('4b7bf300ede85a02e9610de8717e11b9de99fa9d943e16399377701e8a70cce1')

prepare() {
  cd $pkgname-game-$pkgver
  ./packdata.sh
  mkdir -p ../build
}

build() {
  cd build
  cmake ../$pkgname-game-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
