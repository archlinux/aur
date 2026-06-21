# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154,2164
# shellcheck shell=bash

pkgname=charasay-bin
pkgver=3.3.2
pkgrel=2
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("x86_64" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
conflicts=("charasay")
provides=("charasay")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/chara-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/chara-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('d6b5c9b7da27ea36d91a37aec675aab2d8ec32ebe84248990e9ef197a18e82d5')
sha256sums_aarch64=('e4ea025bc84421e9e86643a80560eb46f94beeb2c8f6cc15dcd84958cbaf4132')

build() {
  cd "$srcdir"

  # generate completions
  ./chara completions --shell zsh >"$srcdir/_chara"
  ./chara completions --shell bash >"$srcdir/chara.bash"
  ./chara completions --shell fish >"$srcdir/chara.fish"
}

package() {
  cd "$srcdir"

  install -Dm755 chara "${pkgdir}/usr/bin/chara"

  install -Dm644 _chara "${pkgdir}/usr/share/zsh/site-functions/_chara"
  install -Dm644 chara.bash "${pkgdir}/usr/share/bash-completion/completions/chara.bash"
  install -Dm644 chara.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chara.fish"
}
