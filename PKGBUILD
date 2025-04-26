# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=biolibc
pkgver=0.2.7
pkgrel=1
pkgdesc="High-performance, memory-efficient bioinformatics library"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/biolibc"
license=('BSD-2')
depends=('glibc')
makedepends=('libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d01f8e200a92ae893e69a6e2ed4d7e3939bd2559d1dabe87b9150496eba65cbe')

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
