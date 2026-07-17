# Maintainer: Loganavter

pkgname=python-sli-ui-toolkit
_pyname=sli-ui-toolkit
_distname=sli_ui_toolkit
pkgver=3.1.0
pkgrel=1
pkgdesc="Reusable PySide6 UI toolkit primitives for SLI desktop tools"
arch=('any')
url="https://github.com/Loganavter/sli-ui-toolkit"
license=('MIT')
depends=('python' 'pyside6' 'python-markdown')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-qt')
source=("https://files.pythonhosted.org/packages/source/s/${_pyname}/${_distname}-${pkgver}.tar.gz")
# Refresh after the PyPI sdist is published for this version.
sha256sums=('725882a083ea4d47544bb8c28426cc980da8e8e9a51b1fad1a580957c0f5780a')

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
