# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-bin
pkgver=0.15.10
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
sha256sums_x86_64=('10df33ec0b6cb380b1354b55bd8a32fdc2f00fec281b7dc0a41086bd0038e0fc')
sha256sums_aarch64=('0a545957d894cec8a4ca9010d05a7fa27beb1e356c2b221b7f7f704538ff0bb0')
sha256sums_armv7h=('8b334de94c91d95d679d59a920f0d850a33778b14fc3ce9061cba9f157f4fdc2')

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
