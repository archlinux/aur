# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r304.0b3bdff
pkgrel=1
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL3')
depends=('curl' 'libarchive' 'ninja' 'cmake' 'ccache')
provides=('sibs')
conflicts=('sibs')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.r304.0b3bdff.tar.gz")
sha512sums=('00fd14bfcc316974ccd16df101a91817dc36e7a098af4bd4b6028332168958d593b95861d2ab72991be1869cb428ca8dd64682a09395cd41c0fa5553e3d87de9')

build() {
  cd "$srcdir/cmake"
  mkdir release
  cd release
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../../
  ninja
}

package() {
  cd "$srcdir/cmake/release"
  install -Dm755 sibs "$pkgdir/usr/bin/sibs"
}
