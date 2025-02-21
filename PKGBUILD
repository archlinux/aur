# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=2.0.0a2
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-jupyter-core jupyter-server python-ipykernel python-platformdirs nodejs npm)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-deps-selector python-hatch-jupyter-builder)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('6f10f3fc4c8c712e7916fdfd8810e0a6b22c45ec419ee330212552139784adcc528644f00daf61e1be0df08e76845a01296ac6c866c9cab1ea03553c719ec8de')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
