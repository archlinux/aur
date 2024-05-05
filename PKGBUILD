# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-spectrum
pkgver=0.6.5
pkgrel=1
pkgdesc="This is a electrum-adapter. It exposes a Bitcoin-Core style API while using an electron API in the backend."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-embit' 'python-flask' 'python-flask-sqlalchemy' 'python-psycopg2' 'python-pytest' 'python-pysocks')
source=("https://github.com/cryptoadvance/spectrum/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('6f648fc97a394f73453e9e3055fccbb71660fe391f3f6ade92c7715cd717eaf4')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "spectrum-${pkgver}"
  python setup.py build
}

package() {
  cd "spectrum-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  
  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/spectrum-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
