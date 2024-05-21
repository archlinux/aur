# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nodepy
pkgname=python-${_base}
pkgdesc="Analysis of initial value ODE solvers"
pkgver=1.0.1
pkgrel=1
arch=(any)
url="https://github.com/ketch/${_base}"
license=(BSD-3-Clause-Modification)
depends=(python-matplotlib python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('694a1bda042ea2e5902917a836da67f2b6c03d3e58b3c9eea2af04ab532b51dc7a9fc6ae495b82f417a9685ed5fe03e9da0553c177095b1922916f01e7da0520')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
