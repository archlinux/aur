# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tabcompleter
pkgname=python-${_base}
pkgdesc="Autocompletion in the Python console"
pkgver=1.3.3
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3f8436f63e6566c52b6317c7ed9b7d0993dc05cc8d202b8fe2275430c5b08ee5e27d77bec654839d14ba39d9ae2bf8f5bd4e084861a886d8cef4ebe98232f9df')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
