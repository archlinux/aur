# Maintainer: aksr <aksr at t-com dot me>
pkgname=nuweb
pkgver=1.58
pkgrel=1
epoch=
pkgdesc="A Simple Literate Programming Tool"
arch=(any)
url="http://nuweb.sourceforge.net/"
license=('unknown')
groups=()
depends=('texlive-core')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=nuweb.install
changelog=
source=("http://downloads.sourceforge.net/project/nuweb/$pkgname-$pkgver.tar.gz" "nuweb.install")
noextract=()
md5sums=('85ce11cfdf5d6ebc82309bcd3e26fd6f'
         'aa285f8379d9d62b469591e0a2dd0bd7') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"

  latex nuwebdoc
  bibtex nuwebdoc
  latex nuwebdoc
  latex nuwebdoc

	make nuweb
  ./nuweb nuweb.w
  ./nuweb nuwebsty.w
  pdflatex nuweb.tex
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/{emacs/site-lisp,texmf/tex/latex,/doc/$pkgname,man/man1}

  install -D -m755 $srcdir/$pkgname-$pkgver/nuweb        $pkgdir/usr/bin/nuweb
  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.1      $pkgdir/usr/share/man/man1/nuweb.1
  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.el     $pkgdir/usr/share/emacs/site-lisp/nuweb.el
  install -D -m644 $srcdir/$pkgname-$pkgver/README       $pkgdir/usr/share/doc/$pkgname/README

  install -D -m644 $srcdir/$pkgname-$pkgver/bibnames.sty $pkgdir/usr/share/texmf/tex/latex/$pkgname/bibnames.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/html.sty     $pkgdir/usr/share/texmf/tex/latex/$pkgname/html.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/nwhren.sty   $pkgdir/usr/share/texmf/tex/latex/$pkgname/nwhren.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/nwhres.sty   $pkgdir/usr/share/texmf/tex/latex/$pkgname/nwhres.sty

  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.pdf    $pkgdir/usr/share/doc/$pkgname/nuweb.pdf
  install -D -m644 $srcdir/$pkgname-$pkgver/nuwebdoc.dvi $pkgdir/usr/share/doc/$pkgname/nuwebdoc.dvi
}

