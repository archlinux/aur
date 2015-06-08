# Contributor: Tim Besard <tim.besard@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-subfiles
pkgver=1.1
pkgrel=1
pkgdesc="Individual typesetting of subfiles of a "main" document."
arch=('any')
url="http://ctan.org/tex-archive/macros/latex/contrib/subfiles"
license=('GPL')
depends=('texlive-core')
install='texlive-subfiles.install'
source=('http://mirrors.ctan.org/macros/latex/contrib/subfiles/subfiles.dtx'
'http://mirror.ctan.org/macros/latex/contrib/subfiles/subfiles.ins')
md5sums=('a5cae23439a4633da4aed36ca1ad69ba'
         '8473b0f4d5f7e5f02d927a6a0e77ad43')

build() {
  cd "$srcdir"
  [ -f subfiles.sty ] && rm subfiles.sty
  [ -f subfiles.cls ] && rm subfiles.cls
  [ -f subfiles.pdf ] && rm subfiles.pdf
  [ -f subfiles.aux ] && rm subfiles.aux
  pdflatex -interaction=batchmode subfiles.ins
  pdflatex -interaction=batchmode subfiles.dtx
}

package() {
  cd "$srcdir"
  install -Dm644 subfiles.sty $pkgdir/usr/share/texmf/tex/latex/subfiles.sty
  install -Dm644 subfiles.cls $pkgdir/usr/share/texmf/tex/latex/subfiles.cls
  install -Dm644 subfiles.pdf $pkgdir/usr/share/texmf/doc/latex/subfiles.pdf
}
