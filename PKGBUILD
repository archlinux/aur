# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgname=texlive-xkeyval
_filename='xkeyval'
pkgver=2.7a
pkgrel=3
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
    latex xkeyval.dtx
    latex xkeyval.dtx
    bibtex xkeyval
    makeindex -s gglo.ist -o xkeyval.gls xkeyval.glo
    makeindex -s gind.ist -o xkeyval.ind xkeyval.idx
    latex xkeyval.dtx
    latex xkeyval.dtx
}

package() {
    cd                          "$srcdir/$_filename"
    install -d -m775            "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"
    install -d -m775            "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
    cp  README              \
        xkeyval.pdf         \
        xkeyval.bib         \
        xkvex1.tex          \
        xkvex2.tex          \
        xkvex3.tex          \
        xkveca.cls          \
        xkvecb.cls          \
        xkvesa.sty          \
        xkvex4.tex          \
        xkvesb.sty          \
        xkvesc.sty              "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"

    cp  xkeyval.tex         \
        xkeyval.sty         \
        keyval.tex          \
        xkvtxhdr.tex        \
        xkvview.sty         \
        pst-xkey.tex        \
        pst-xkey.sty            "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
}
