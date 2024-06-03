# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xeus-python-shell
pkgname=python-${_base}
pkgdesc="The xeus-python core python logic"
pkgver=0.6.3
pkgrel=1
arch=(any)
url="https://github.com/jupyter-xeus/${_base}"
license=(BSD-3-Clause)
depends=(python-debugpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: IPython support'
  'python-pyjs: wasm support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0d5c83b50424719203d927c032f333363fc1f54c33b33ce9eb8d51340ad891bf34c00d7ff6b567a8b82df45d84fe3f6484f9e9d344a6d6e1a86e89fa91986452')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
