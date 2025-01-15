# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=2.0.0a1
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-jupyter-core jupyter-server python-ipykernel python-platformdirs nodejs npm)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-deps-selector python-hatch-jupyter-builder)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('b9399541489004faf2b04983c6816c09514b247eab1f8daff3d144d6342e27c8d9076a227dfdd3a7f9fb46b37381b5f7df207c1517da4fa7e28628df5799819b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
