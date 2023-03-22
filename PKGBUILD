# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-spectrum
pkgver=0.6.3
pkgrel=1
pkgdesc="This is a electrum-adapter. It exposes a Bitcoin-Core style API while using an electron API in the backend."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-embit' 'python-flask' 'python-flask-sqlalchemy' 'python-psycopg2' 'python-pytest' 'python-pysocks')
source=("https://github.com/cryptoadvance/spectrum/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('2384d9a80e4d5a2ac35bca0dc4858492989a24347a677327f2839749d637e116')

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
