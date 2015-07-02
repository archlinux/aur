# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
pkgname=tesseract-svn
pkgver=837
pkgrel=1
pkgdesc="An OCR Engine that was developed at HP Labs between 1985 and 1995"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tesseract-ocr/"
license=('Apache')
depends=('gcc-libs' 'libtiff' 'libpng' 'leptonica' 'giflib')
makedepends=('subversion')
provides=('tesseract')
conflicts=('tesseract')
options=('!libtool')
source=('tesseract::svn+http://tesseract-ocr.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tesseract"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/tesseract"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/tesseract"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-langs
}
