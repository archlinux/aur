# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=biolibc
pkgver=0.2.5
pkgrel=1
pkgdesc="High-performance, memory-efficient bioinformatics library"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/biolibc"
license=('BSD-2')
depends=('glibc')
makedepends=('libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5273dbf4e5135ac8f11e503c3ef516ec1c73906b1ec196a0a28606d88d3d394a')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" install
  strip -s "$pkgdir"/usr/lib/libbiolibc.so.2.0
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
