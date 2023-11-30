# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus
pkgname="python-${_name}"
pkgver=5.1.8
pkgrel=1
pkgdesc="A framework for scientific/industrial CLIs and GUIs"
arch=('any')
url="https://gitlab.com/taurus-org/${_name}"
license=('LGPL3')
depends=(python-pyqt5 python-lxml python-click python-pint python-ply)
makedepends=(python-setuptools)
optdepends=('python-pytango: for integration with TANGO control system'
            'python-sardana: for integration with Sardana'
            'python-epics: for integration with EPICS control system'
            'python-taurus-pyqtgraph: for pyqtgraph based trends'
            'python-pymca5: for extra pymca5 widgets'
            'python-guiqwt: for extra guiqwt widgets'
            'spyder: for a qt based editor within taurus')
source=("$_name-$pkgver.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('2fd9bf481fa0b77bee7fc9789150752441a75b98016dd77fffb211eba20aebc1')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
