# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-bin
pkgver=0.15.8
pkgrel=1
pkgdesc="Integrated language service for Typst (LSP, CLI, preview server)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Myriad-Dreamin/tinymist"
license=('Apache-2.0')
depends=('libgcc')
optdepends=('tinymist-viewer-bin: standalone native preview client')
provides=("tinymist=$pkgver")
conflicts=('tinymist' 'tinymist-git' 'tinymist-nightly-bin')
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Myriad-Dreamin/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('a9f29769fd3a7ee2976e6e161a93e16461fa305c088c4806242e50ec8ef86bce')
sha256sums_x86_64=('2428932e8d8b593ebc1ac4eed41fb9d3584166e1044bbcdef740b7296c348295')
sha256sums_aarch64=('ec78300e89b34e0958b615b1d42c275fd11bf91d2d27401bbef07150e477f199')
sha256sums_armv7h=('ddee35504e7203c8afc399895695b90912a46e2a1cff932389e635c6fd7c2495')

prepare() {
  cd "$srcdir"
  ./tinymist-*-unknown-linux-*/tinymist completion bash > completions.bash
  ./tinymist-*-unknown-linux-*/tinymist completion zsh > completions.zsh
  ./tinymist-*-unknown-linux-*/tinymist completion fish > completions.fish
}

package() {
  cd "$srcdir"

  install -Dm755 tinymist-*-unknown-linux-*/tinymist "$pkgdir/usr/bin/tinymist"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/tinymist"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_tinymist"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/tinymist.fish"
}
