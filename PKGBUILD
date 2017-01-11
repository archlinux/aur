# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.0.1
pkgrel=1
pkgdesc="An open source clone of Tetris Attack based on SDL"
arch=('i686' 'x86_64')
url="http://www.blockattack.net"
license=('GPL')
depends=('boost-libs' 'jsoncpp' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('14ad07c196dd61ef3aa233e9060ba7aa61139123d06177d92adfea1195a6ee53')

prepare() {
  cd $pkgname-game-$pkgver

  sed -i 's/#ifndef _WIN32/#ifdef _WIN32/' \
    source/code/sago/SagoSpriteHolder.cpp
}

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
