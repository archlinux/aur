# Maintainer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)
pkgname=koboldcpp-cuda
pkgver=1.61.2
pkgrel=1
pkgdesc="KoboldCpp is an easy-to-use AI text-generation software for GGML and GGUF models (with CUDA)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
depends=('python' 'cblas' 'openblas' 'clblast' 'cuda')
optdepends=('customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eea87a2a780b4c99f87e06071a19c4c2508fe873cacb9da0d7cc6561f8e6e88d')

build() {
  cd "$srcdir/koboldcpp-$pkgver"
  make LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_CUBLAS=1 LLAMA_VULKAN=1
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"
  cp -a . "$pkgdir/usr/share/koboldcpp"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
