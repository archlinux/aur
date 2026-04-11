# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('633a38979c7812737e208d8b1757b3991bee964a732e7c4849c63b9ea8430394')

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
