# Maintainer: archlinux.info:tdy

pkgname=lazygull-engine-git
pkgver=r28.db77394
pkgrel=1
pkgdesc="A UCI chess engine based on Gull 3"
arch=(x86_64)
url=https://github.com/basil00/Gull
license=(MIT)
makedepends=(git)
source=(git+https://github.com/basil00/Gull.git)
sha256sums=(SKIP)

pkgver() {
  cd Gull
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Gull/src
  make -f Makefile.linux build
}

package() {
  cd Gull/src
  install -Dm755 LazyGull "$pkgdir"/usr/bin/LazyGull
  sed -n 's/^ .[ ]*//; 3,21p' tbprobe.h > LICENSE
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
