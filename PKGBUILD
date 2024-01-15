# Maintainer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)
pkgname=koboldcpp-cuda
pkgver=1.55.1
pkgrel=1
pkgdesc="Full-featured CUDA build of koboldcpp"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
depends=('python' 'cblas' 'openblas' 'clblast' 'cuda')
optdepends=('customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('094ba13446f3865dd496469bb1dc6070a515f43127f66eec98a2dce517a86732')

build() {
  cd "$srcdir/koboldcpp-$pkgver"
  make LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_CUBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"
  cp -a . "$pkgdir/usr/share/koboldcpp"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
