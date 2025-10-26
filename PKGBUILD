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
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('795626088dc6cb33cd8f53f6139ce697ce317c20253a672ed2fe171004ecb063649847adf9a451acb59f92681a1562feac09a4b61d8dd72fb7891bdb104a2698')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
