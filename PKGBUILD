# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=charasay-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("x86_64" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
conflicts=("charasay")
provides=("charasay")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/chara-linux-x86_64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/chara-linux-aarch64.zip")
sha256sums_x86_64=('25f951f1b5a5f1607fec6dacbac91375a03ea244f753efc6f2f833cdd14f0c2c')
sha256sums_aarch64=('cc04807dbf30809683d2588676b9609edc1050294d685ba72887d58e90039a93')

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
