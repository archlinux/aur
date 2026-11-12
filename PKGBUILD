# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=texlive-emo
_pkgname=emo
pkgver=1.0
pkgrel=3
pkgdesc="Emoji support for all LaTeX engines"
arch=('any')
url="https://github.com/apparebit/emo"
license=('LPPL-1.3c' 'Apache-2.0' 'Unicode-3.0' 'OFL-1.1')

depends=('texlive-latexrecommended')
makedepends=('unzip')

source=("https://github.com/apparebit/emo/releases/download/v1.0/emo-$pkgver.zip")
sha256sums=('022c6c41b9c8124b3cf661130d76a505f08ae71edea81a58da7469f642d7ece0')

prepare() {
  cd "$srcdir"
  unzip -qo emo-$pkgver.zip
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
