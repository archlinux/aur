# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.1.0
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-jupyter-builder jupyterlab python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3bbbad1182c45d46221f6eff3274886fde17bd4ba4e2334ab968d7efa1d5c714c455c4820fde2439b69039c1420e82efa59f51bd26d138a36cf3b233ed7fbd73')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
