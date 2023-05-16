# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.4.6
pkgrel=1
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fac2815d0f08e1ff2c0a903741f537609c27dde88b0347733be7b60b035ce85')

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="/usr" --ldconfig=""
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py build
}

package() {
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py install --root="$pkgdir/" --optimize=1
}

