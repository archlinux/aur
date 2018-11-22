# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.3.0
pkgrel=1
pkgdesc="Open source Tetris Attack clone"
arch=('i686' 'x86_64')
url="https://blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('0ac2fd9c86833ad9de92b4b25350668eadede2384063891e7a2ecdf3d0886761')

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
