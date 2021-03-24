# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.3.12
pkgrel=0
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24/archive/v${pkgver}.tar.gz" "boost-include.patch")
sha256sums=('2c63b5c7d8cdb952679bf3830c2cb25375e95628e531e2e0497aed08767b94b3'
            '2cac9b4bc51943fcf9b7a8a51fdbd116276cd128d1d6375b3d832fcb4934d03a')

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

