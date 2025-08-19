# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkg=pyodoo
pkgname=python-${_pkg}
pkgver=0.7.2
pkgrel=1
pkgdesc="Interact with Odoo servers using XML-RPC"
arch=('any')
url="https://github.com/muflone/pyodoo"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-requests' 'python-xlrd')
optdepends=('python-xlrd: Support for SqlExcelQuery'
            'python-awaitable: Support for asynchronous requests')
options=(!emptydirs)
source=("${_pkg}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkg}/archive/${pkgver}/${pkgver}.tar.gz")
sha256sums=('a551bee2fddcf383fbdede7fefc0b2955b01e0123ca2024bc54018d9724829c2')

build() {
  cd "${_pkg}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkg}-${pkgver}"
  # Disable tests as demo.odoo.com XML-RPC seems unavailable
  # PYTHONPATH='.' pytest -v --color=yes tests
}

package() {
  cd "${_pkg}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
