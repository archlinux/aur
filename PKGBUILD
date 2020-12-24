# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.3.9
pkgrel=2
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24/archive/v${pkgver}.tar.gz" "boost-include.patch")
sha256sums=('7fc2d32a3a226faa78e60ba472ad40f3da97d4d158845f9603d41e1cf8f31ae4'
            '80439c7ae3c30c93e8da055b753bbe047da22815041aea048d723afd75ea1a39')

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

