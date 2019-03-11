# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.4.0
pkgrel=1
pkgdesc="Open source Tetris Attack clone"
arch=('i686' 'x86_64')
url="https://blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('e3627854e5718f6bb51087a262ada9042ed0826e9dd97c255f764a5cec814f22')

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
