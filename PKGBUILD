# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=easyrpg-player
pkgver=0.1.2
pkgrel=2
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player-git')
makedepends=('cmake>=2.8' 'boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'openal' 'libsndfile' 'expat')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/EasyRPG/Player/archive/$pkgver.tar.gz")
sha256sums=('c376d1074f9a2fd7a732b0d3d37f9f60a29e0bdb013e26b60fb9c359ac74ffed')

prepare () {
  # remove old build
  rm -rf build
}

build () {
  mkdir build
  cd build

  cmake ../Player-$pkgver -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed" -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package () {
  cd build

  DESTDIR="$pkgdir/" make install
}
