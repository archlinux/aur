# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=charasay-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("x86_64" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
conflicts=("charasay")
provides=("charasay")
source_x86_64=("$url/releases/download/v$pkgver/chara-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/chara-linux-aarch64.zip")
sha256sums_x86_64=('728c927fa4c8ec3a7dd8fc03ef7594af8e2b66f9fa1426db146ca6a2acbe2467')
sha256sums_aarch64=('85d0b75044c1ba61236351acab03aadee5fee51b41795735cd54b622664c3d58')

build() {
  cd "$srcdir" || exit 1

  # generate completions
  ./chara completions --shell zsh >"$srcdir/_chara"
  ./chara completions --shell bash >"$srcdir/chara.bash"
  ./chara completions --shell fish >"$srcdir/chara.fish"
}

package() {
  cd "$srcdir" || exit 1

  install -Dm755 chara "${pkgdir}/usr/bin/chara"

  install -Dm644 _chara "${pkgdir}/usr/share/zsh/site-functions/_chara"
  install -Dm644 chara.bash "${pkgdir}/usr/share/bash-completion/completions/chara.bash"
  install -Dm644 chara.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chara.fish"
}
