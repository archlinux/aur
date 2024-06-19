# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkg=pyodoo
pkgname=python-${_pkg}
pkgver=0.7.1
pkgrel=1
pkgdesc="Interact with Odoo servers using XML-RPC"
arch=('any')
url="https://github.com/muflone/pyodoo"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-requests' 'python-xlrd')
optdepends=('python-xlrd: Support for SqlExcelQuery')
options=(!emptydirs)
source=("https://github.com/muflone/${_pkg}/releases/download/${pkgver}/${_pkg}-${pkgver}.tar.gz")
sha256sums=('a378f9db41d02b62b66e3e4afd0920ad121f98ec80ff61bb3d94c66bdb285094')

build() {
  cd "${_pkg}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkg}-${pkgver}"
  PYTHONPATH='.' pytest -v --color=yes tests
}

package() {
  cd "${_pkg}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
