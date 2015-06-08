# Maintainer: trya <tryagainprod@gmail.com>

pkgname=gcube
pkgver=0.4.0
pkgrel=2
pkgdesc="A GameCube emulator, part of the devkitPPC project (including various utilities)"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org"
license=('GPL')
depends=('sdl' 'libgl' 'libjpeg' 'zlib')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/emulators/gcube%200.4.0/$pkgname-$pkgver-src.tar.bz2")
md5sums=('2354b60a9494fe5669addaf915efeda9')

prepare() {
  cd "$srcdir/gcube"
  sed -e 's|LIBS=-lz $(OPENGL)|LIBS=-lm -lz $(OPENGL)|' \
      -i Makefile.rules
}

build() {
  cd "$srcdir/gcube"
  make
}

package() {
  cd "$srcdir/gcube"
  install -D gcube "$pkgdir/usr/bin/gcube"
  install -D bin2dol "$pkgdir/usr/bin/bin2dol"
  install -D gcmap "$pkgdir/usr/bin/gcmap"
  install -D isopack "$pkgdir/usr/bin/isopack"
  install -D thpview "$pkgdir/usr/bin/thpview"
  install -D tplx "$pkgdir/usr/bin/tplx"
  
  mkdir -p "$pkgdir/usr/share/doc/gcube"
  cp README README.debug ChangeLog "$pkgdir/usr/share/doc/gcube"
}
