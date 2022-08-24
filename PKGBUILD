# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=basix
pkgname=python-fenics-${_base}
pkgdesc="Basix Python interface"
pkgver=0.5.0.post0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
makedepends=(python-scikit-build pybind11)
depends=(basix python-numpy)
# checkdepends=(python-pytest python-numba python-sympy python-scipy)
# optdepends=('python-numba: for numba_helpers support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cadce6b4935200714f4f25b0fd72a9ee3484ab319104b9c80d2653218787418bf8f42bee7c3dcec83669c809460538442b4244474a5bbe59688b207b6b892faf')

build() {
  cd ${_base}-${pkgver}/python
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
