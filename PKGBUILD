# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-jupyterbook-latex
pkgname=python-${_base}
pkgdesc="Latex specific features for jupyter book"
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(BSD-3-Clause)
depends=(python-sphinx python-packaging)
makedepends=(python-build python-flit-core python-installer python-wheel)
# checkdepends=(python-pytest python-sphinx-external-toc python-texsoup)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c88b6fe9c2386d931a2dfdad7bb4cd33d82894086b39ed6e578ec329b127892e8cfa0f107b1531c3aea541da0c244c55de81428e81e7e08554a30b77ac773378')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest --ignore=tests/test_config.py --ignore=tests/test_sphinx.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
