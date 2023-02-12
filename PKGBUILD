# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=generand
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple and fast tool for generating random genomic data in common formats for testing and benchmarking purposes"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/generand"
license=('BSD-2')
depends=('glibc')
makedepends=('biolibc' 'libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d728b8dee36381a081022de25d3665297d625479b140fcb05dca87abc382d65')

build() {
  cd "$pkgname-$pkgver"
  export VERSION=${pkgver}
  make clean depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/share/man
  make DESTDIR="$pkgdir" PREFIX="/usr" MANPREFIX="/usr/share" install
  rm -Rf "$pkgdir"/usr/man/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
