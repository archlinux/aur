# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=2.0.0b1
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-jupyter-core jupyter-server python-ipykernel python-platformdirs python-nodeenv nodejs)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-deps-selector python-hatch-jupyter-builder npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('f042a53f82cf14b4bc98dc3df1322a24b5c86fbdd8644dcccf87770d2c9797dfed2b09f232dbc85d77e866922219a47ad0bd866fe69b06788c7c8191407482ea')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
