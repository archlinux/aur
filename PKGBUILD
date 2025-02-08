# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24-network
pkgver=2.0.3
pkgrel=0
pkgdesc='Networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('GPL2')
depends=(
'rf24'
'pigpio'
)
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('3354dc290cc6143998a358a1a0eea5980667dd21c1582b55ecf09047856b4055')

build() {
  cd "$srcdir/RF24Network-$pkgver"
  sed 's/@ldconfig//' Makefile > Makefile.copy
  mv Makefile.copy Makefile
  make -j1
}

package() {
  cd "$srcdir/RF24Network-$pkgver"
  make -j1 PREFIX="$pkgdir/usr" install
  cd "$pkgdir/usr/lib"
  rm librf24network.so librf24network.so.1
  ln -s librf24network.so.1.0 librf24network.so
  ln -s librf24network.so.1.0 librf24network.so.1
}

