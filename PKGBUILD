# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tabcompleter
pkgname=python-${_base}
pkgdesc="Autocompletion in the Python console"
pkgver=1.4.1
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c37be1891a2565aaf837511aaf478294a1c2b0f029b97b87d25856cea33f46d8d4c06eafa12d4bdd558e75f98b7a47ea3fddfb94967989aff6764e892eac0028')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
