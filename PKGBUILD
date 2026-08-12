# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-bin
pkgver=0.15.2
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
sha256sums_x86_64=('9b8a1aea6bb3fc9c39cb70496f0082bd518cfede555757bc3cb5225b05abc99b')
sha256sums_aarch64=('eba8e14338cf211906d77be6b18102736222da6721e98161133fa0d8ff5ab599')
sha256sums_armv7h=('d59855725851c47c20798b8d7f64855d3aa7db50c6269bef747569dc5ae72c68')

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
