# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.4.8
pkgrel=0
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=(
'boost-libs'
'python'
'rf24'
)
makedepends=(
'boost'
'python-setuptools'
)
source=("https://github.com/nRF24/RF24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dca5f3e28d6206505ba7839b8ef3576e25f0f227904239e3bdc3ffa2fa042573')

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

