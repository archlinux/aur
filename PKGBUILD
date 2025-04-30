# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus
pkgname="python-${_name}"
pkgver=5.2.4
pkgrel=1
pkgdesc="A framework for scientific/industrial CLIs and GUIs"
arch=("any")
url="https://gitlab.com/taurus-org/${_name}"
license=("LicenseRef-custom" "LGPL-3.0-or-later")
depends=(python python-pygments python-pyqt5 python-lxml python-click python-pint python-ply)
makedepends=(python-setuptools python-build python-installer)
optdepends=("python-pytango: for integration with TANGO control system"
            "python-sardana: for integration with Sardana"
            "python-epics: for integration with EPICS control system"
            "python-taurus-pyqtgraph: for pyqtgraph based trends"
            "python-pymca5: for extra pymca5 widgets"
            "python-guiqwt: for extra guiqwt widgets"
	    "python-pyqtgraph: for extra graph widgets"
            "spyder: for a qt based editor within taurus"
	    "python-pytest: for testing")
source=("$_name-$pkgver.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("7d583988b1ad8bfcdc9d909bf628c12d25ebe60c6650c39a079a500a2957d5d8")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
