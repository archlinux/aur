# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pyhanko-certvalidator
pkgname='python-pyhanko-certvalidator'
pkgver=0.20.0
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-asn1crypto' 'python-oscrypto' 'python-cryptography'
         'python-uritools')
makedepends=('python-setuptools')
checkdepends=('python-oscrypto-tests' 'python-aiohttp' 'python-freezegun')
source=("${_name}-${pkgver}.tar.gz::https://github.com/MatthiasValvekens/certvalidator/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3975e6732d37d9982b81a3cf89643b659e6d9d0077820b6ee483f5d41c5b042c')

build() {
  cd certvalidator-${pkgver}
  python setup.py build
}

check() {
  cd certvalidator-${pkgver}
  python -m pytest
}

package() {
  cd certvalidator-${pkgver}
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
