# Maintainer: Gil Forsyth <gilforsyth@gmail.com>
# Contributor: Jason Ford <jeford93@gmail.com>

pkgname=bibclean
pkgver=2.17
pkgrel=2
pkgdesc="BibTeX bibliography file prettyprinter and syntax checker"
license=(GPL3)
arch=('i686' 'x86_64')
url="http://ftp.math.utah.edu/pub//bibclean/"
source=(http://ftp.math.utah.edu/pub//$pkgname/$pkgname-$pkgver.tar.gz)
makedepends=('gcc')
md5sums=('797d7791bcefad1ef36445ecb138a92e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/man\/man1/share\/man\/man1/' Makefile.in
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/man/man1"
  make prefix=$pkgdir/usr install
}
