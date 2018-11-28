# Contributor: Tim Besard <tim.besard@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-subfiles
pkgver=1.2
pkgrel=1
pkgdesc="Individual typesetting of subfiles of a main document."
arch=('any')
url="http://ctan.org/tex-archive/macros/latex/contrib/subfiles"
license=('GPL')
depends=('texlive-core')
source=('http://mirrors.ctan.org/macros/latex/contrib/subfiles/subfiles.dtx'
'http://mirror.ctan.org/macros/latex/contrib/subfiles/subfiles.ins')
sha256sums=('5a853144d21c340bb336c9d165d3b7cb56a13a6820c8eea756d3e5e9350de13a'
            '8fd19018ed31e0ea5e106a36264b03bfb146abdf09002da259417e4da981fead')

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
  install -Dm644 subfiles.sty "$pkgdir"/usr/share/texmf/tex/latex/subfiles.sty
  install -Dm644 subfiles.cls "$pkgdir"/usr/share/texmf/tex/latex/subfiles.cls
  install -Dm644 subfiles.pdf "$pkgdir"/usr/share/texmf/doc/latex/subfiles.pdf
}
