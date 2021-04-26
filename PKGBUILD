# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-pytenable')
_pyname=pyTenable
depends=('python-defusedxml' 'python-requests' 'python-dateutil' 'python-semver' 'python-ipaddress' 'python-requests-pkcs12' 'python-restfly' 'python-box' 'python-marshmallow')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
optdepends=('python-docker: Docker support')
pkgver=1.2.8
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/pyTenable/archive/${pkgver}.tar.gz")
sha512sums=('421b4e49d4820e00f1fdc77ed72f1dfe6b4f171ff67be4ae309611f4bb801ec46edb2c6c53ab66528a149d44a150d5ff14dedfb2d853c603aa485f51e6d913a5')

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

