# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xeus-python-shell
pkgname=python-${_base}
pkgdesc="The xeus-python core python logic"
pkgver=0.6.6
pkgrel=1
arch=(any)
url="https://github.com/jupyter-xeus/${_base}"
license=(BSD-3-Clause)
depends=(python-debugpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: IPython support'
  'python-pyjs: wasm support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('3dcacb72ab3299b4da87b6647997d5e8e370649421799d6d06a5f7be300acdb3cb950f662f283c6231009b4e5fa74c7633586be38a301fcd18b620c470bd9722')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
