# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=freetype2-demos
pkgver=2.6.3
pkgrel=1
pkgdesc="Freetype2 utilities such as ftdump and ftview."
arch=('i686' 'x86_64')
url="http://www.freetype.org"
license=('GPL')
depends=('libx11' 'zlib' 'freetype2')
source=(http://download.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2 
  http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2)
md5sums=('f7c6102f29834a80456264fe4edd81d1'
         '0037b25a8c090bc8a1218e867b32beb1')

build() {
  cd "$srcdir"
  mv freetype-$pkgver freetype2

  # build freetype2
  cd freetype2
  ./configure --prefix=/usr
  make
  
  cd ../ft2demos-$pkgver
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/ft2demos-$pkgver"
  install -d "$pkgdir/usr/bin/"
  install -m755 bin/.libs/ft* "$pkgdir/usr/bin/"
}
