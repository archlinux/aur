#Maintainer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo), YellowRoseCx
pkgname=koboldcpp-hipblas
pkgver=1.53
pkgrel=1
pkgdesc="HIPBLAS build of koboldcpp"
arch=('x86_64')
url="https://github.com/YellowRoseCx/koboldcpp-rocm"
license=('AGPL3')
depends=('python' 'cblas' 'openblas' 'clblast' 'hipblas' 'customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YellowRoseCx/koboldcpp-rocm/archive/refs/tags/v$pkgver.yr0-ROCm.tar.gz")
md5sums=('2dfdcae87ec35518d8f66309caa8dff0')

build() {
  cd "$srcdir/koboldcpp-rocm-$pkgver.yr0-ROCm"
  make LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_HIPBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-rocm-$pkgver.yr0-ROCm"

  install -d "$pkgdir/usr/share/koboldcpp"
  cp -a . "$pkgdir/usr/share/koboldcpp"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
