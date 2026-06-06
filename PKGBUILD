# Maintainer: Loganavter

pkgname=python-sli-ui-toolkit
_pyname=sli-ui-toolkit
_distname=sli_ui_toolkit
pkgver=0.2.8
pkgrel=1
pkgdesc="Reusable PyQt UI toolkit primitives for SLI desktop tools"
arch=('any')
url="https://github.com/Loganavter/sli-ui-toolkit"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-markdown')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-qt')
source=("https://files.pythonhosted.org/packages/source/s/${_pyname}/${_distname}-${pkgver}.tar.gz")
sha256sums=('73eb6eba5257d7cf91e38a393a4462cc6f12980d24037ef025ff84c893f77db2')

build() {
  cd "${_distname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_distname}-${pkgver}"
  QT_QPA_PLATFORM=offscreen pytest
}

package() {
  cd "${_distname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
