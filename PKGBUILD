# Maintainer: orumin <dev@orum.in>

_basename=wildmidi
pkgname="lib32-$_basename"
pkgver=0.3.9
pkgrel=1
pkgdesc='Open Source MIDI Synthesizer (32-bit)'
arch=('x86_64')
url="http://www.mindwerks.net/projects/wildmidi/"
license=('LGPL3')
depends=('lib32-alsa-lib' 'wildmidi')
makedepends=('cmake')
source=(https://github.com/psi29a/wildmidi/archive/wildmidi-${pkgver}.tar.gz)
md5sums=('243ad6d754c84c5767749058c7a919c1')

prepare() {
  mkdir build
}

build() {
  cd build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake ../$_basename-$_basename-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  mv bin/wildmidi wildmidi32
  rm -rf bin
  mkdir -p bin
  mv wildmidi32 bin/

  mv lib lib32

  rm -r share include
}
