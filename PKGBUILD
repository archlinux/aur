# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.3.0
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-jupyter-builder jupyterlab python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d671eed3ea946e0cc2de3a816f2d8d8fadff6c6ee90a33586cf174d256ad087771020de0fc21d6a2ce200d534539a2a375b690689c7e11abf472b008f33f1245')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
