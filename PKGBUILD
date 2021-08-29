# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.4.1
pkgrel=1
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14b822d7f984dbdba96c4715172b33eade054aaefbc72f1153c0fe9243ddd22a')

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

