# Maintainer: Joe Maples <joe@maples.dev>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-cozette-ttf
_cozettever=1.19.2
_nfver=3.0.0
pkgver="${_cozettever}_${_nfver}"
pkgrel=1
pkgdesc="Cozette Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/slavfox/cozette/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
source=("https://github.com/slavfox/Cozette/releases/download/v.${_cozettever}/CozetteVector.ttf" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('4fc7ec4f48eaf0046dd6989fc1ae313df3706631199e15e1583d0dbdab7b02f3' '68958b6d6ab1acf73196d3f1fa8ae3e8c49f970ba565ff47add4323628455a52' 'SKIP')

build() {
  _patcher="font-patcher-$_nfver"
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  python "$srcdir/$_patcher" --makegroups 0 --glyphdir "$srcdir/glyphs/" -out "$srcdir/patched" "$srcdir/CozetteVector.ttf"
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
