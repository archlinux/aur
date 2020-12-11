# Maintainer: Jjohn Regan <john@jrjrtech.com>

pkgname=libgme-git
pkgver=r215.013d467
pkgrel=1
pkgdesc="Video game music file emulation/playback library (git version)"
url="https://bitbucket.org/mpyne/game-music-emu"
license=('LGPL')
arch=('x86_64')
depends=('gcc-libs' 'libunrar')
makedepends=('cmake' 'git')
source=('game-music-emu::git+https://bitbucket.org/mpyne/game-music-emu.git')
sha256sums=('SKIP')

provides=('libgme')
conflicts=('libgme')

pkgver() {
  cd "$srcdir/game-music-emu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/game-music-emu"
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_UBSAN=OFF
  make
}

package() {
  cd "$srcdir/game-music-emu/build"
  make DESTDIR="${pkgdir}" install
}
