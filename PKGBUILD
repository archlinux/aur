# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=('python-pymisp')
_pyname=PyMISP
pkgver=2.4.142
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated' 'python-cachetools')
optdepends=('lief' 'python-oletools' 'python-magic' 'python-beautifulsoup4' 'python-validators' 'python-recommonmark'
  'python-reportlab' 'python-urllib3')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('f2ac02ac6c4d3cdaa51c23ae2cfabeadc08e8f54210a97ea074e423061e5c73edd8629c3e56a7e93fbe3293f25a0088d5a10b3da80a1e446f6f5a000ceba02ae')

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
