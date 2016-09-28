# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=miscfilters
pkgname=vapoursynth-plugin-${_plug}
pkgver=3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173871'
license=('GPL')
depends=('vapoursynth')
source=("https://dl.dropboxusercontent.com/u/36232595/vapoursynth/vapoursynth-miscfilters-${pkgver}.tar.gz")
sha1sums=('dac36085bf4b11470a685ef870de7d5b1337a576')

prepare() {
  cd *"${plug}"*
  echo "all:
	  g++ -c -std=c++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o misc.o misc.cpp
	  g++ -shared  -fPIC ${LDFLAGS} -o libvs${_plug}.so misc.o"> Makefile
}

build() {
  cd *"${plug}"*
  make
}

package(){
  cd *"${plug}"*
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
