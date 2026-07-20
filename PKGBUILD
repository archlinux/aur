# Maintainer: Loganavter

pkgname=python-sli-ui-toolkit
_pyname=sli-ui-toolkit
_distname=sli_ui_toolkit
pkgver=v3.1.11
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
sha256sums=('683a15f5abb5dca938085a8396ef30a7cb36e2c8eb9e5054acfc38da76525b89')

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
