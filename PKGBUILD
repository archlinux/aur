# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkg=pyodoo
pkgname=python-${_pkg}
pkgver=0.9.3
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
sha256sums=('89ee09a9917ae134f2f508e4d01c5d6ae549ed20ae886585f2282037461e7f6c')

build() {
  cd "${_pkg}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkg}-${pkgver}"
  # Disable XML-RPC/JSON-RPC tests as on demo.odoo.com they're unavailable
  PYTHONPATH='.' pytest -v -k TestCasesWebRpc --color=yes tests
}

package() {
  cd "${_pkg}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
