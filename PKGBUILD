# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-pytenable')
_pyname=pyTenable
depends=('python-defusedxml' 'python-requests' 'python-dateutil' 'python-semver' 'python-ipaddress' 'python-requests-pkcs12' 'python-restfly' 'python-box' 'python-marshmallow')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
optdepends=('python-docker: Docker support')
pkgver=1.2.1
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/pyTenable/archive/${pkgver}.tar.gz")
sha512sums=('9c190395587b7a06f78170cb848199a2f8a801d4bc40f8d68c9e4ab93078c73553cad44dc0c465ddaff65160f4183fd3b5a7bc8ca41855433e8907b9ce6e4fc4')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

