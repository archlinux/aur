# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.6.0
pkgrel=1
pkgdesc="Open source Tetris Attack clone"
arch=('i686' 'x86_64')
url="https://blockattack.net"
license=('GPL')
depends=('boost-libs' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'utf8cpp' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz"
        "utf8cpp.patch")
sha256sums=('0967966e04e11c45dc0fe24b3caa583e591b4c7b39511d69805320ea22a21990'
            'a3e6591e597d715d50037e9f15b9a4e5ce80cebe1e54e1eaaa95ca6c8d1858ec')

prepare() {
  cd $pkgname-game-$pkgver
  ./packdata.sh
  patch -p1 -i ../utf8cpp.patch
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
