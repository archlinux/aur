# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xeus-python-shell
pkgname=python-${_base}
pkgdesc="The xeus-python core python logic"
pkgver=0.8.1
pkgrel=1
arch=(any)
url="https://github.com/jupyter-xeus/${_base}"
license=(BSD-3-Clause)
depends=(python-debugpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: IPython support'
  'python-pyjs: wasm support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('e57bc7a1668b06cad6ca107c350e672c7f5368c6127952ba97cb25382ae39d391a47607ecc2dbf18771b288e590e526c301c779a928291ed810ddd1dee346342')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
