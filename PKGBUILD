# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=tesseract-git
pkgver=982.d00d833
pkgrel=1
pkgdesc="An OCR Engine that was developed at HP Labs between 1985 and 1995"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tesseract-ocr/"
license=('Apache')
depends=('gcc-libs' 'libtiff' 'libpng' 'leptonica' 'giflib')
makedepends=('git')
provides=('tesseract')
conflicts=('tesseract')
options=('!libtool')
source=('tesseract::git+https://github.com/tesseract-ocr/tesseract.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tesseract"
  echo $(git rev-list --count master).$(git rev-parse --short master)
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
