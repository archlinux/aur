# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.1.0
pkgrel=1
pkgdesc="An open source clone of Tetris Attack based on SDL"
arch=('i686' 'x86_64')
url="http://www.blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('f30b3c8b57734921cd2d095d2aae8f253afcc91256fe5d3f38bfeff090524c23')

build() {
  cd $pkgname-game-$pkgver

  ./packdata.sh

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-game-$pkgver

  make DESTDIR="$pkgdir" install
}
