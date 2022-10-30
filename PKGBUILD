# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pyhanko-certvalidator
pkgname='python-pyhanko-certvalidator'
pkgver=0.19.6
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-asn1crypto' 'python-oscrypto' 'python-cryptography'
         'python-uritools')
makedepends=('python-setuptools')
checkdepends=('python-oscrypto-tests' 'python-aiohttp')
source=("${_name}-${pkgver}.tar.gz::https://github.com/MatthiasValvekens/certvalidator/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b34f3ad5d335763171444135ecb86cc92dc264722f4645c224e63853f4b66a0c')

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
