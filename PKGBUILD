# Maintainer: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-multitoc-numbering
pkgname=python-${_base}
pkgdesc="Supporting continuous HTML section numbering"
pkgver=0.1.3
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-build python-setuptools python-installer python-wheel)
# checkdepends=(python-pytest-regressions python-beautifulsoup4)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c3cc46cf328fc6c07ef14362c7d1a4eebcbc158588cd9c23c135b1d21283fc234d2cec0f58feb243e7148cce7b0a59e6d1a13b739affb98d022c9c136a985f26')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
