# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tabcompleter
pkgname=python-${_base}
pkgdesc="Autocompletion in the Python console"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('447e265fa5557886f129efdedaf2c555ab03faff6b95b6550bcb65ffb74555d9d5c54d87c35b66abf848302573121bb28f0dd19380f07739cc3758fc4eb265e7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
