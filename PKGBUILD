# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.15.9
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('66afbee460fcb7595d301553aa61aa7b47ba6d3a171c0c2782311b975ab07c8c')

package() {
  cd "$srcdir/"
  ./xremap --completions zsh > zsh_completions
  ./xremap --completions fish > fish_completions
  ./xremap --completions bash > bash_completions
  install -Dm644 zsh_completions "${pkgdir}/usr/share/zsh/site-functions/_xremap"
  install -Dm644 fish_completions "${pkgdir}/usr/share/fish/vendor_completions.d/xremap.fish"
  install -Dm644 bash_completions "${pkgdir}/usr/share/bash-completion/completions/xremap"
  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
