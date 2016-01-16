# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgname=texlive-xkeyval
_filename='xkeyval'
pkgver=2.7a
pkgrel=2
pkgdesc="Provides a Key-Value store system for LaTeX documents"
license=('LPPL')
arch=(any)
depends=('texlive-latexextra' 'texlive-fontsextra' 'texlive-pstricks')
url='https://www.ctan.org/pkg/xkeyval'
source=('http://mirrors.ctan.org/macros/latex/contrib/xkeyval.zip')
install=texlive-xkeyval.install
sha256sums=('e3c8753c159cf796d9826d84df73fe2fa3ea078eae26588b907bcebe101ae90b')

build() {
    cd "$srcdir/$_filename"
    latex $_filename.dtx
    latex $_filename.dtx
    bibtex $_filename
    makeindex -s gglo.ist -o $_filename.gls $_filename.glo
    makeindex -s gind.ist -o $_filename.ind $_filename.idx
    latex $_filename.dtx
    latex $_filename.dtx
}

package() {
    cd "$srcdir/$_filename"
    install -d -m775    "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"
    install -d -m775    "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
    cp  README \
        xkeyval.pdf \
        xkeyval.bib     "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"
    cp  *.sty \
        *.tex           "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
}
