# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-stacktrack
pkgver=0.3.0
pkgrel=1
pkgdesc="Specter Desktop plugin to add time series charts for visualizing wallet balances."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-embit' 'python-flask' 'python-flask-sqlalchemy' 'python-psycopg2' 'python-pytest' 'python-pysocks')
source=("https://github.com/cryptoadvance/specterext-stacktrack/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('5adebe57c8eb142e3d0d1563031b22ef802f6e343a2cacb29e602dd06e6ca405')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "$pkgname-${pkgver}"
  python setup.py build
}

package() {
  cd "$pkgname-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  
  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
