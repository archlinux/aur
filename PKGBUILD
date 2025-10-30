# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nodepy
pkgname=python-${_base}
pkgdesc="Analysis of initial value ODE solvers"
pkgver=1.1.1
pkgrel=1
arch=(any)
url="https://github.com/ketch/${_base}"
license=(BSD-3-Clause-Modification)
depends=(python-matplotlib python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1e9fe9763404ffbcc8a001e09945c90df91c69c658b90cf859e45d0845a520d42157eb109c8c09b7a994c0f2ae4fe51f09512e707d5e78f9f4a3cbe7002b89c5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
