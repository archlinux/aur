# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=rf24-network
pkgver='1.0.9'
pkgrel=2
pkgdesc='Networking with RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24Network/'
license=('GPL2')
depends=('rf24')
source=('https://github.com/nRF24/RF24Network/archive/v1.0.9.tar.gz')
sha256sums=('1b38748d3b23f04d7ed5cb935eb57441085c6e2d6d51c61e2d2c77a9a227dbc9')

build() {
  cd "$srcdir/RF24Network"
  sed 's/@ldconfig//' Makefile > Makefile.copy
  mv Makefile.copy Makefile
  make -j1
}

package() {
  cd "$srcdir/RF24Network"
  make -j1 PREFIX="$pkgdir/usr" install
  cd "$pkgdir/usr/lib"
  rm librf24network.so librf24network.so.1
  ln -s librf24network.so.1.0 librf24network.so
  ln -s librf24network.so.1.0 librf24network.so.1
}

