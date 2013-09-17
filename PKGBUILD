# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=easyrpg-player-git
_gitname=Player
pkgver=0.1.1.34.g99a32b6
pkgrel=1
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter (development version)."
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player')
provides=('easyrpg-player')
makedepends=('cmake>=2.8' 'boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'boost-libs' 'openal' 'libsndfile' 'lua' 'expat')
install="$pkgname.install"
source=("git://github.com/EasyRPG/Player.git"
        "$pkgname.install")
md5sums=('SKIP'
         '8ceae8f6dfa0eeff7e8029e6ee792386')
sha256sums=('SKIP'
            '187f2c695b2ad0471cea3679956ab77e1c191b082182ee6d776447990ef1edc1')

pkgver() {
  cd $_gitname

  # Use last tag and incrementing counter as version
  git describe --tags --always | sed 's|-|.|g'
}

prepare () {
  cd "$srcdir"

  # remove old build dir
  rm -rf build
}

build () {
  cd "$srcdir"

  mkdir build
  cd build

  cmake ../Player/builds/cmake/ -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed" -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package () {
  cd "$srcdir/build"

  DESTDIR="$pkgdir" make install
}
