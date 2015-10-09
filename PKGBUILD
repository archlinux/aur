# Maintainer: maz-1 <loveayawaka at gmail dot com>
_pkgname=onscripter-jh
pkgname=${_pkgname}-hg
pkgver=74
pkgrel=1
pkgdesc="onscripter fork with custom improvements."
arch=('i686' 'x86_64')
url="https://bitbucket.org/jh10001/onscripter-jh"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'smpeg' 'libjpeg-turbo' 'bzip2' 'libvorbis')
makedepends=('mercurial')
conflicts=('onscripter-jh')
provides=('onscripter-jh')
source=("hg+https://bitbucket.org/jh10001/$_pkgname")
md5sums=('SKIP')
pkgver() {
  cd $srcdir/$_pkgname
  hg id -n
}

build() {
    cd $srcdir/$_pkgname
    hg update SDL2
    echo 'LIBS = `sdl2-config --libs` `smpeg-config --libs` -lSDL2_ttf -lSDL2_image -lSDL2_mixer -lbz2 -ljpeg -lm -logg -lvorbis -lvorbisfile
CFLAGS += -c `sdl2-config --cflags` `smpeg-config --cflags` -DLINUX -DUSE_OGG_VORBIS -std=c++11 -DUSE_SDL_RENDERER
OBJSUFFIX = .o
CC = g++
LD = g++ -o
TARGET = onscripter
include Makefile.onscripter' > Makefile
    make
    
}

package() {
	cd $srcdir/$_pkgname
	install -Dm 755 ${srcdir}/$_pkgname/onscripter ${pkgdir}/usr/bin/onscripter-jh
}
