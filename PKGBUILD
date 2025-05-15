# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=blockattack
pkgver=2.9.1
pkgrel=2
pkgdesc="Open source Tetris Attack clone"
arch=('i686' 'x86_64')
url="https://blockattack.net"
license=('GPL')
depends=('gcc-libs' 'glibc' 'boost-libs' 'sdl2' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'physfs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockattack/blockattack-game/archive/v$pkgver.tar.gz")
sha256sums=('41d10426adb225aa4956286d724f09f0494280c8b077b6b063e84b41e1e2903b')

prepare() {
  cd $pkgname-game-$pkgver
  ./packdata.sh
  mkdir -p ../build
}

build() {
  cd build
  cmake ../$pkgname-game-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
