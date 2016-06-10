# Contributor: Mildred <mildred593 at online dot fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=glosstex
pkgver=0.4
pkgrel=6
pkgdesc="Prepare glossaries in LaTeX."
arch=('i686' 'x86_64')
url="http://www.dante.de/CTAN/help/Catalogue/entries/glosstex.html"
depends=('texlive-core')
makedepends=('make' 'unzip')
license=('GPL')
source=("http://mirror.ctan.org/support/$pkgname.zip" \
  docu.patch Makefile.patch)
md5sums=('d5f90382e94fee60fcc431e827d40008'
         '1fba401a02aa3f3ad2cebea10cd20176'
         '300f01b751d7f3dcae7eeb8ea1ca6459')

build() {
    cd "$srcdir/$pkgname"
    patch Makefile ../Makefile.patch
    patch $pkgname.dtx ../docu.patch
    make
    make doc
}

package() {
    cd "$srcdir/$pkgname"
    install -d $pkgdir/usr/share/texmf/tex/latex/$pkgname
    install -Dm644 $pkgname.ist \
      $pkgdir/usr/share/texmf/makeindex/$pkgname/$pkgname.ist
    install -Dm644 $pkgname.pdf \
      $pkgdir/usr/share/texmf/doc/$pkgname/$pkgname.pdf
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
    install -m644 $pkgname.sty $pkgname.std \
      $pkgdir/usr/share/texmf/tex/latex/$pkgname
}
