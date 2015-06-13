# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=freetype2-demos
pkgver=2.5.5
pkgrel=1
pkgdesc="Freetype2 utilities such as ftdump and ftview."
arch=('i686' 'x86_64')
url="http://www.freetype.org"
license=('GPL')
depends=('libx11' 'zlib' 'freetype2')
source=(http://download.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2 
  http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2)
md5sums=('a30cf68418a468384515057eaca0f7fa'
         '2a7a314927011d5030903179cf183be0')

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


