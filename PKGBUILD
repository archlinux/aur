# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24-network
pkgver=1.0.15
pkgrel=0
pkgdesc='Networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('GPL2')
depends=('rf24')
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('08d0a7e22709ba49f787ddf64f908b4319600a1de95b0567f577e5cb11806862')

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

