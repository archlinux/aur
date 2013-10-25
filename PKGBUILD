# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=easyrpg-player
pkgver=0.1.2
pkgrel=1
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter."
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player-git')
makedepends=('cmake>=2.8' 'boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'boost-libs' 'openal' 'libsndfile' 'lua' 'expat')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/EasyRPG/Player/archive/$pkgver.tar.gz"
        "$pkgname.install")
md5sums=('51e1476fdae1b05917274d5fd3556561'
         'bc45142571f7077981a2da6cd2a21bd1')
sha256sums=('c376d1074f9a2fd7a732b0d3d37f9f60a29e0bdb013e26b60fb9c359ac74ffed'
            '80ead4ae70a3192e3e16b9ad36cdd40b0a6271e1a082e574687ccbadd62404ca')

prepare () {
  cd "$srcdir"

  # remove old build
  rm -rf build
}

build () {
  cd "$srcdir"

  mkdir build
  cd build

  cmake ../Player-$pkgver -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed" -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package () {
  cd "$srcdir/build"

  DESTDIR="$pkgdir" make install
}
