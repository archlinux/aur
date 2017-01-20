# Maintainer: archlinux.info:tdy

pkgname=rucksack
pkgver=3.1.0
pkgrel=1
pkgdesc="Texture packer and resource bundler"
arch=(i686 x86_64)
url=https://github.com/andrewrk/rucksack
license=(MIT)
depends=(freeimage liblaxjson)
makedepends=(cmake)
source=(https://github.com/andrewrk/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(dcdaab57b06fdeb9be63ed0f2c2de78d0b1e79f7a896bb1e76561216a4458e3b)

build() {
  mkdir $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd $pkgname-$pkgver/build
  make test
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
