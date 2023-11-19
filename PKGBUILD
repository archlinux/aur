#Maintainer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo), YellowRoseCx
pkgname=koboldcpp-hipblas
pkgver=1.48.1
pkgrel=1
pkgdesc="HIPBLAS build of koboldcpp"
arch=('x86_64')
url="https://github.com/YellowRoseCx/koboldcpp-rocm"
license=('AGPL3')
depends=('python' 'cblas' 'openblas' 'clblast' 'hipblas')
optdepends=('customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YellowRoseCx/koboldcpp-rocm/archive/refs/tags/$pkgver.yr2-ROCm.tar.gz")
md5sums=('f029e7405ba489863eeb8088b228de89')

build() {
  cd "$srcdir/koboldcpp-rocm-$pkgver"
  make LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_HIPBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-rocm-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"
  cp -a . "$pkgdir/usr/share/koboldcpp"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
