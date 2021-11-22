# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.7.0
pkgrel=1
pkgdesc="Open source Tetris Attack clone"
arch=('i686' 'x86_64')
url="https://blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('e132790d72d54eb40112dfb43d39191b2bf88a9572e34b25a5d2d70419f2f592')

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
