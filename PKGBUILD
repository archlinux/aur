# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=primer3
pkgver=2.3.7
pkgrel=2
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs')
url="http://primer3.sourceforge.net"
source=("https://netix.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c6b89067bf465e62b6b1fd830b5b4418')

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
