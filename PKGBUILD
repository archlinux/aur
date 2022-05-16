# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=basix
pkgname=python-fenics-${_base}
pkgdesc="Basix Python interface"
pkgver=0.4.2
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-scikit-build pybind11)
# checkdepends=(python-pytest python-numba python-sympy python-scipy)
# optdepends=('python-numba: for numba_helpers support')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0a1fc7b06a30a0fb4599ab53e930e259ac23163553f5e7b5a25bd7c451548850ae995ad7f43003cec43b2b177823de18d457e26e1430587da3ee58f91960d641')

build() {
  cd ${_base}-${pkgver}
  python setup.py build \
    --build-type=None \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
