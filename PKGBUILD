# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.1.2
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-jupyter-builder jupyterlab python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b9fbdbe743567f1dd4376ef19fb25da3440d23b54f82e41cfc042f676c94866e1e0b7ff2cb8fbceae0f8a4968df89929d2640eb045c693766f95d8c39f09a1a6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
