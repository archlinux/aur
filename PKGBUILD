# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=basix
pkgname=python-fenics-${_base}
pkgdesc="Basix Python interface"
pkgver=0.4.2.post1
pkgrel=3
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
makedepends=(python-scikit-build pybind11)
depends=(basix python-numpy)
# checkdepends=(python-pytest python-numba python-sympy python-scipy)
# optdepends=('python-numba: for numba_helpers support')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a158627f5b7c1d3a25706d774957ab97a0dfb3f8f60082773cf1d50ee84443f51a8581230acb13eb967a9a9d2d09283908421845d1c7063b7f5c00afe7e3d025')

build() {
  cd ${_base}-${pkgver}/python
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
