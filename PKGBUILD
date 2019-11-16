# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver='1.3.3'
pkgrel=0
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
source=('https://github.com/nRF24/RF24/archive/v1.3.3.tar.gz')
sha256sums=('34a6bef3e14801f79f55fce66b7787e0810032a56b4d01788f618bfa51185147')

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="$pkgdir/usr" --ldconfig=''
}

package() {
  cd "$srcdir/RF24-$pkgver"
  make -j1 install
  cd "$pkgdir/usr/lib"
  rm librf24.so librf24-bcm.so
  ln -s librf24.so.1 librf24.so
  ln -s librf24.so librf24-bcm.so
}

