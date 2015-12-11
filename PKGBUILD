# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=freetype2-demos
pkgver=2.6.2
pkgrel=1
pkgdesc="Freetype2 utilities such as ftdump and ftview."
arch=('i686' 'x86_64')
url="http://www.freetype.org"
license=('GPL')
depends=('libx11' 'zlib' 'freetype2')
source=(http://download.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2 
  http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2)
md5sums=('b11dd2f9a4b511e842d31a50e4a63627'
         '86109d0c998787d81ac582bad9adf82e')

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
