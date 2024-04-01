# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.4.8
pkgrel=0
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dca5f3e28d6206505ba7839b8ef3576e25f0f227904239e3bdc3ffa2fa042573')

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="$pkgdir/usr" --ldconfig=''
}

package() {
  cd "$srcdir/RF24-$pkgver"
  make -j1 install
  cd "$pkgdir/usr/lib"
  rm librf24.so librf24-bcm.so librf24.so.1.4
  ln -s librf24.so.1 librf24.so.1.4
  ln -s librf24.so.1 librf24.so
  ln -s librf24.so librf24-bcm.so  
}

