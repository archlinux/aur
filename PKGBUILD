# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=finitediff
pkgname=python-${_base}
pkgdesc="Finite difference weights for any derivative order on arbitrarily spaced grids"
pkgver=0.6.4
pkgrel=1
arch=(any)
url="https://github.com/bjodah/${_base}"
license=(BSD-2-Clause)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('d9b1b45400cd4bfcfccfe0b3322e1db251f4e060e6b33d2c50c55e1744711589f4d67cd795dbf40abb840c274ad619d80741fda69f797b77ea619a087a5fb04d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}/examples
  make
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
