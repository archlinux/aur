# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.4.0
pkgrel=0
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24/archive/v${pkgver}.tar.gz" "boost-include.patch")
sha256sums=('2c20edc08c6089bcfa1d97ac105fca9ac2b51d8fdf6201c616fd144ec3311317'
            'deaa26d965708ed35ad0c31485a3a3e4d4c2ebb09f3a5243e264b5721b698fab')

prepare() {
    cd "$srcdir"
    patch --forward --strip=1 --input="${srcdir}/boost-include.patch"
}

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="/usr" --ldconfig=''
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py build
}

package() {
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py install --root="$pkgdir/" --optimize=1
}

