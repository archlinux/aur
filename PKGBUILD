# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24-network
pkgver=2.0.5
pkgrel=1
pkgdesc='Networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('GPL2')
depends=(
'rf24'
'pigpio'
)
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('54a0c34cc0774be36fb63200710ede44468dbdf7109bbe9de35ab073d25e4b70')

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

