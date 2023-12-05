# Maintainer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)
pkgname=koboldcpp-cpu
pkgver=1.51.1
pkgrel=1
pkgdesc="CPU build of koboldcpp"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
depends=('python' 'cblas' 'openblas')
optdepends=('customtkinter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('3b4b638986fc0b311172d3696381a1e0')

build() {
  cd "$srcdir/koboldcpp-$pkgver"
  make LLAMA_OPENBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"
  cp -a . "$pkgdir/usr/share/koboldcpp"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
