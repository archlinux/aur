# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=easyrpg-player-git
_gitname=Player
pkgver=0.1.2.47.g2a136ad
pkgrel=1
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter (development version)."
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player')
provides=('easyrpg-player')
makedepends=('cmake>=2.8' 'boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'openal' 'libsndfile' 'expat')
install=$pkgname.install
source=(git://github.com/EasyRPG/Player.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

prepare () {
  # remove old build
  rm -rf build
}

build () {
  mkdir build
  cd build

  cmake ../Player -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed" -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package () {
  cd build

  DESTDIR=$pkgdir make install
}
