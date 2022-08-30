# Maintainer: Joe Maples <joe@maples.dev>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-cozette-ttf
_cozettever=1.16.0
_nfver=2.2.1
pkgver="${_cozettever}_${_nfver}"
pkgrel=1
pkgdesc="Cozette Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/slavfox/cozette/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
source=("https://github.com/slavfox/Cozette/releases/download/v.${_cozettever}/CozetteVector.ttf" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('a9635fbf749616ef15b852c2d955411039915cdf36f6cf28e9688327794b1fab' '3aa32f05bd5e34efd3b74c7d08f9a6ee1ecfc280497921ed060f8a9e50bd270d' 'SKIP')

build() {
  _patcher="font-patcher-$_nfver"
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -out "$srcdir/patched" "$srcdir/CozetteVector.ttf"
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
