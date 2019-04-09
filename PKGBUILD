# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=primer3
pkgver=2.4.0
pkgrel=1
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs')
url="http://primer3.sourceforge.net"
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname-org/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6d537640c86e2b4656ae77f75b6ad4478fd0ca43985a56cce531fb9fc0431c47')

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
