# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.4.5
pkgrel=0
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b96823b1ca9ecc7d6b5045b6e5b82374e48761a6c79acd092d1ae0efec7b209d')

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

