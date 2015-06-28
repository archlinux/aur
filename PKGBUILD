# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='ppcoin-daemon'
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.ppcoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("http://downloads.sourceforge.net/project/ppcoin/0.4.0/ppcoin-0.4.0-linux.tar.gz")
sha256sums=('561076e8d4e82085d577eb717b9f8b52571556fea2b8181fa8eb6039218d3f06')
pkgdesc="P2P Long-Term Energy-Efficient Crypto-Currency (daemon)"
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/ppcoin-$pkgver-linux/src"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  cd "$srcdir/ppcoin-$pkgver-linux/src"
  install -Dm755 src/ppcoind "$pkgdir"/usr/bin/ppcoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/ppcoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/ppcoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/ppcoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

