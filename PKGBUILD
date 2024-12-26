# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=2.0.0a0
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-jupyter-core jupyter-server python-ipykernel python-platformdirs)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-deps-selector python-hatch-jupyter-builder npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('cc5bea7cbb9444f1ce8ae07b1597c37101e4aa1c288c6e208a5471f710cdad50e582da377d2d2c54c361febdb7751149e02fe76cb4fe7e610545a10160b9fad5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
