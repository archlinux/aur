# Contributor: shade
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtex2html
pkgver=1.98
pkgrel=1
pkgdesc="Collection of tools for producing HTML documents from bibtex-bibliographies"
url="http://www.lri.fr/~filliatr/bibtex2html/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('perl')
makedepends=('ocaml' 'hevea' 'texlive-latexextra' 'texlive-bibtexextra')
source=(http://www.lri.fr/~filliatr/ftp/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('33a96d32d6ca870163855573253aa720')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf
  ./configure --prefix=/usr
  sed -i 's+-lstr+/usr/lib/ocaml/libcamlstr.a+' Makefile
  make 
  # to get cross references right
  hevea manual.tex
  pdflatex manual.tex
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install 
  install -Dm644 manual.pdf $pkgdir/usr/share/doc/$pkgname/$pkgname.pdf
  install -Dm644 manual.html $pkgdir/usr/share/doc/$pkgname/$pkgname.html
}
