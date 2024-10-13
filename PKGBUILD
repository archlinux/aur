# Maintainer: Joe Maples <joe@maples.dev>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-cozette-ttf
_cozettever=1.25.2
_nfver=3.2.1
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
  'd0553fc6e6f5cd9721d1d8a4f7e45f1cf852cbea0b897b1ef3443ab2772515cb'
  '7825c0507457437facecad6216ade1a1bffd9f24b9f5c59e5e84958dbb31f2d6'
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
