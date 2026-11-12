
# Maintainer: Dom
pkgname=texlive-emo-git
_pkgname=emo
pkgver=0.4.r85.g1ed3bb4
pkgrel=6
pkgdesc="Emoji support for all LaTeX engines (development version)"
arch=('any')
url="https://github.com/apparebit/emo"
license=('LPPL-1.3c' 'Apache-2.0' 'Unicode-3.0' 'OFL-1.1')

depends=('texlive-latexextra')
makedepends=('git')

provides=('texlive-emo-full')
conflicts=('texlive-emo-full')

source=("emo::git+https://github.com/apparebit/emo.git#branch=boss")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "0.4.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    local texmf="$pkgdir/usr/share/texmf/tex/latex/emo"

    install -d "$texmf"
  
    pdftex emo.dtx
    
    install -Dm644 emo.sty "$texmf/emo.sty"
    install -Dm644 emo-support.sty "$texmf/emo-support.sty"
    install -Dm644 emo.sty.ltxml "$texmf/emo.sty.ltxml"
    install -Dm644 emo.def "$texmf/emo.def"
    install -Dm644 emo-lingchi.ttf "$texmf/emo-lingchi.ttf"

    install -d "$texmf/emo-graphics"
    cp -a emo-graphics/. "$texmf/emo-graphics/"

    install -Dm644 README.md \
        "$pkgdir/usr/local/share/doc/$pkgname/README.md"

    install -Dm644 emo.pdf \
        "$pkgdir/usr/local/share/doc/$pkgname/emo.pdf"
}
