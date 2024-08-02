# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgdesc="Bidirectional communication for the PyViz ecosystem"
pkgver=3.0.3
pkgrel=1
arch=(any)
url="https://github.com/pyviz/${_base}"
license=(BSD-3-Clause)
depends=(python-param jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e65d1d8fcd41d855d519bf58904628e93507ef183a2af370c450fcaf3bd9cd17168891e8e7d8d2965b61fe333868d6a8eda4153fbe066d69a1ff9dca250c7add')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
