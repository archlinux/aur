# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-jupyterbook-latex
pkgname=python-${_base}
pkgdesc="Latex specific features for jupyter book"
pkgver=0.5.2
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=('custom:BSD-3-clause')
depends=(python-sphinx)
makedepends=(python-build python-setuptools python-installer python-wheel)
# checkdepends=(python-pytest python-sphinx-external-toc python-texsoup)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8a356dfe8afc01acc63a080aa973c72376c3b1411b45364bc48b2c9b4921e7e66d009d71923719e69d9595152efab4a1ccd248f2241c54fc6a183c79919f5587')

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
