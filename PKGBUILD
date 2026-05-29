# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xeus-python-shell
pkgname=python-${_base}
pkgdesc="The xeus-python core python logic"
pkgver=0.8.0
pkgrel=1
arch=(any)
url="https://github.com/jupyter-xeus/${_base}"
license=(BSD-3-Clause)
depends=(python-debugpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: IPython support'
  'python-pyjs: wasm support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0ac3df7cdfbb578019545578f5e2a13acb1bdbee3375de23859bb3d929dd5440760346aa21fa1855ef02efcc716975e3768d54c8669a6c68c05e133fc437c38f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
