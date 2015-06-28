# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='terracoin-daemon'
pkgver=0.8.0.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.terracoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("https://github.com/terracoin/terracoin/archive/v$pkgver.tar.gz")
sha256sums=('59d0a1925939add4bc70054541a7f032c8c566e73c2ec1a4da9c48a079bd0438')
pkgdesc="P2P decentralized digital currency with fast confirmation and no central issuer (daemon)"
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/terracoin-$pkgver"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  cd "$srcdir/terracoin-$pkgver"
  install -Dm755 src/terracoind "$pkgdir"/usr/bin/terracoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/terracoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/terracoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/terracoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

