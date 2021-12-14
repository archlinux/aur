# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=python-rf24
pkgver=1.4.1
pkgrel=2
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24/archive/v${pkgver}.tar.gz" "boost-include.patch")
sha256sums=('14b822d7f984dbdba96c4715172b33eade054aaefbc72f1153c0fe9243ddd22a'
            '08f2893ce8e866a94fc6ab672ec28944f5b94cfe77ac5380dfe5e88d1a04a05a')

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

