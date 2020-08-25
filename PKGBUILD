# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=('python-pymisp')
_pyname=PyMISP
pkgver=2.4.130
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated' 'python-cachetools')
optdepends=('lief')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('9643522e01506e780cad1e2bf158fa82293f911e32bd89a303303aca53091d3c58c7668a262ccbe8fb7168c30972dda0f1b411ce236cb075d2c1ce26efb9874e')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  rm -rf "$pkgdir/usr/lib/python3.8/site-packages/tests"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
