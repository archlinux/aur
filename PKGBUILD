# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.4.0
pkgrel=0
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c20edc08c6089bcfa1d97ac105fca9ac2b51d8fdf6201c616fd144ec3311317')

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

