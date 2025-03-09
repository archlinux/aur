# Maintainer: Joe Maples <joe@maples.dev>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-cozette-ttf
_cozettever=1.26.0
_nfver=3.3.0
pkgver="${_cozettever}_${_nfver}"
pkgrel=1
pkgdesc="Cozette Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/slavfox/cozette/'
license=('custom:OFL')
makedepends=('fontforge' 'python')
source=(
  "https://github.com/slavfox/Cozette/releases/download/v.${_cozettever}/CozetteVector.ttf"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip"
)
sha256sums=(
  '946a5c368a68c463f5d7b7ef5786f488e8eb5059769e650650573614be6152dc'
  'ce4284e7d1a8816d29bb3a358e33a44e55804792e7925ed0022ba1b3ab1a9d34'
)

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  python "$srcdir/font-patcher" -q -c "$srcdir"/*.ttf -out "$srcdir/patched"
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
