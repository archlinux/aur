# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pythreejs
pkgname=jupyter-${_base}
pkgver=2.4.1
pkgrel=2
pkgdesc="Interactive 3D graphics for the Jupyter Notebook and JupyterLab, using Three.js and Jupyter Widgets"
arch=('x86_64')
url="https://github.com/jupyter-widgets/${_base}"
license=('custom:BSD-3-clause')
depends=(python-ipydatawidgets)
makedepends=(python-build python-installer jupyterlab python-wheel npm) # yarn
# checkdepends=(python-pytest python-nbval)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('093498184c9fec09ff77de09c8f20309dea065b2bb23a210997b91bb12ad3464af6af0273852d2c4173a2356c0b6be4cc4732f02c2d00cb0b35580d30a6e740e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   # rm -rf ${_base}
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
