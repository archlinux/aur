# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkg=pyodoo
pkgname=python-${_pkg}
pkgver=0.8.0
pkgrel=1
pkgdesc="Interact with Odoo servers using XML-RPC"
arch=('any')
url="https://github.com/muflone/pyodoo"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-xlrd')
optdepends=('python-xlrd: Support for SqlExcelQuery'
            'python-awaitable: Support for asynchronous requests')
options=(!emptydirs)
source=("${_pkg}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkg}/archive/${pkgver}/${pkgver}.tar.gz")
sha256sums=('b711519c02ecb4928de427f878fecda3c443dc1d6b0ea109f5e5d54c2add954e')

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
