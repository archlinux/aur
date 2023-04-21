# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=charasay-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("x86_64" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
conflicts=("charasay")
provides=("charasay")
source_x86_64=("$url/releases/download/v$pkgver/chara-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/chara-linux-aarch64.zip")
sha256sums_x86_64=('0427ee114b986c091a6d718decc5254a68a85ae9a8b64b296f020f99351befee')
sha256sums_aarch64=('98b6e76690b131bc818368b4647cdccf9b278d01aa4e01d819fa0052a7543536')

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
