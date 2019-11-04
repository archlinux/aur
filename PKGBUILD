# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader-git
pkgver=0.16.0.r775.4680436
pkgrel=1
pkgdesc="Open source modding toolkit for Halo Custom Edition"
depends=('libtiff' 'libarchive' 'freetype2')
makedepends=('cmake' 'git' 'python')
arch=('i686' 'x86_64')
url="https://invader.opencarnage.net"
license=('GPL')
source=('git+https://github.com/Kavawuvi/Invader.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/Invader
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  for i in invader-{archive,bitmap,build,compress,dependency,font,indexer,info,resource,string}; do
     install -Dm755 $i "$pkgdir"/usr/bin/$i
  done
}
