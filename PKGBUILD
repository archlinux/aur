# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=ttrk
pkgver=0.7.0
pkgrel=1
pkgdesc="Tektracker is a console based MIDI tracker/sequencer.  Requires /dev/midi."
arch=('i686' 'x86_64')
url="http://vektor.ca/audio/ttrk/"
license=('GPL2')
depends=('slang' 'zlib')
source=(http://vektor.ca/audio/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('168dde66d1b8e0d3cb44b70c4c541537')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # little patches to make it compile
  sed -i 's/song.h>/song.h>\n#include <stdlib.h>\n#include <string.h>/' src/screen.cpp
  sed -i 's/pwd.h>/pwd.h>\n#include <stdlib.h>/' src/utils.cpp

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
