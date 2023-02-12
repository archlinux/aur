# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=biolibc
pkgver=0.2.4
pkgrel=5
pkgdesc="High-performance, memory-efficient bioinformatics library"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/biolibc"
license=('BSD-2')
depends=('glibc')
makedepends=('libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('57535bb4f18f98cbfd47707c60f8a66fa411403d7897be257985046d82a3e94b')

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
