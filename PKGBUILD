# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.4.0
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-jupyter-builder jupyterlab python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d8e760781cb3cfb8ba1cc7da559fb73df6dced082a343cc3353ed7460516a74f5adf99680923cd455ded427993db721a6931054ff798364b4cc2ab02eccf5a83')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
