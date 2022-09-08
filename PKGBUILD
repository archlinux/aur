# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pyhanko-certvalidator
pkgname='python-pyhanko-certvalidator'
pkgver=0.19.5
pkgrel=2
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-asn1crypto' 'python-oscrypto' 'python-cryptography'
         'python-uritools')
makedepends=('python-setuptools')
checkdepends=('python-oscrypto-tests' 'python-aiohttp')
source=("${_name}-${pkgver}.tar.gz::https://github.com/MatthiasValvekens/certvalidator/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2b3eabe4383340f8939eb559e7accfcf68e79a609bbd05ece3a7e959af1fcf4e')

build() {
  cd certvalidator-${pkgver}
  python setup.py build
}

check() {
  cd certvalidator-${pkgver}
  python run.py tests
}

package() {
  cd certvalidator-${pkgver}
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
