# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=('python-pymisp')
_pyname=PyMISP
pkgver=2.4.143
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
sha512sums=('5b987c74f1556489a02d32452d62f188a3e91a27b4e4c5329c586acda88bee6cecdbfd374ee668ce5dc92645b4a485215dbc5b2f676cd7f618132d8925e6fbed')

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
