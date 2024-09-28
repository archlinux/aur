# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jesse R Codling <codling@umich.edu>
_base=jupyterlab-variableInspector
pkgname=python-${_base,,}
pkgdesc="Jupyterlab extension that shows currently used variables and their values"
pkgver=3.2.4
pkgrel=1
arch=(any)
url="https://github.com/jupyterlab-contrib/${_base}"
depends=(jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder npm)
license=(MIT)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3affd6c1259c766cc817eafa394d96859edee8dbc0b60fb72cbf27ae70e3aa6c34ed990844febaac384990be13bd9e5e71279a06117a46911b4fac85cffc8fe8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
