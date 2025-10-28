# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver=1.5.0
pkgrel=1
pkgdesc='Linux support for RF24 radio modules'
arch=(any)
url='https://github.com/nRF24/RF24'
license=('GPL2')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd66d5f4fa0b8153231b4863f4c9747aad4484e61461076919cb8dbaabfc8a36')

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="$pkgdir/usr" --ldconfig=''
}

package() {
  cd "$srcdir/RF24-$pkgver"
  make -j1 install
  cd "$pkgdir/usr/lib"
  rm librf24.so librf24-bcm.so librf24.so.1.5
  ln -s librf24.so.1 librf24.so.1.5
  ln -s librf24.so.1 librf24.so
  ln -s librf24.so librf24-bcm.so  
}

