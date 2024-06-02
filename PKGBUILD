# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-jupyter-extension
pkgname=python-${_base}
pkgdesc="Jupyter extension for trame client/server communication"
pkgver=2.1.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(BSD-3-Clause)
depends=(python-trame jupyterlab jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3113005804e0dc0c63b092c1f43f3e8db0130291ebeddbf36d0881e5d88eb78216e8af6abb074fb77ce65898d26df9703eb873f234eabba370d59740f9aa490f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
