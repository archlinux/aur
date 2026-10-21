# Maintainer: Michael Schubert <mschu.dev at gmail> https://github.com/mschubert/PKGBUILDs
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.30
pkgrel=2
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=(any)
url="https://ctan.org/pkg/media9"
license=(LPPL-1.3c BSD-3-Clause MPL-1.1 OFL-1.1)
depends=(texlive-latexextra)
source=($_pkgname-$pkgver.zip::https://mirrors.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
sha256sums=('5ba1eafac310f7f6fd108f8cde216831c4b0653e75f8c957670fcd423c107d78')

package() {
  cd "$_pkgname"
  local texdir="$pkgdir/usr/share/texmf/tex/latex/$_pkgname"
  local docdir="$pkgdir/usr/share/texmf/doc/latex/$_pkgname"
  install -Dm644 -t "$texdir" *.sty
  cp -r players javascript "$texdir/"
  install -dm755 "$docdir"
  cp -r doc/* "$docdir/"
  install -m644 README.md ChangeLog "$docdir/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" players/BSD-License players/StrobeMediaPlayback-license
}
