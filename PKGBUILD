# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.4.9
pkgrel=0
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0abdbf82cf852e68ca00e052af04c75c4c6ed4daee6222dea6f095c608a388a')

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

