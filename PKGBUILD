# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader-git
pkgver=0.1.0.r139.73ee482
pkgrel=1
pkgdesc="Open source editing tools for Halo Custom Edition"
depends=('libtiff' 'libpng')
makedepends=('cmake' 'git')
arch=('i686' 'x86_64')
url="https://github.com/Kavawuvi/Invader"
license=('GPL')
source=('git+https://github.com/Kavawuvi/Invader.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/Invader
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  mkdir -p build
}

build() {
  cd "$srcdir"/build
  cmake ../Invader
  make
}

package() {
  cd "$srcdir"/build
  for i in invader-{bitmap,build,crc,indexer}; do
     install -Dm755 $i "$pkgdir"/usr/bin/$i
  done
}
