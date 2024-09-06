# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.1.3
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-jupyter-builder jupyterlab python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fbd43988bee1d0a0731414bcdc3d0f863fcaa8d81298ebe26af89a8891c2c51fbfb89eb6d5cdca68243de0a138052e945d77a2af71b54c5b3154292dfe2a97e5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
