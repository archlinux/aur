# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=primer3
pkgver=2.6.1
pkgrel=1
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs')
url=https://github.com/primer3-org/primer3
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('805cef7ef39607cd40f0f5bb8b32e35e20007153a0a55131dd430ce644c8fb9e')

build() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make CFLAGS=-fpermissive
}

check() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make test
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/src
  for EXEC in long_seq_tm_test ntdpal ntthal oligotm primer3_core; do
      install -Dm755 $EXEC "$pkgdir"/usr/bin/$EXEC
  done
  install -dm755 "$pkgdir"/usr/share
  cp -dpr --no-preserve=ownership primer3_config "$pkgdir"/usr/share/primer3
}
