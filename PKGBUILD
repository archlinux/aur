# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=zlib-zpipe
pkgver=1.2.11
pkgrel=1
pkgdesc="example of proper use of zlib's inflate() and deflate(), also a nice filtering compression solution"
arch=('x86_64')
license=('custom')
url="https://www.zlib.net/"
depends=('glibc')
source=("https://zlib.net/zlib-${pkgver}.tar.gz"{,.asc})
md5sums=('1c9f62f0778697a09d36121ead88e08e'
         'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')

prepare() {
  cd zlib-$pkgver
  grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build() {
  cd zlib-$pkgver/examples
  gcc -o zlib-zpipe -lz zpipe.c
}

package() {
  cd zlib-$pkgver
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 examples/$pkgname "$pkgdir"/usr/bin/$pkgname
}
