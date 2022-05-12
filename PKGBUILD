# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=basix
pkgname=python-fenics-${_base}
pkgdesc="Basix Python interface"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-scikit-build pybind11)
# checkdepends=(python-pytest python-numba python-sympy python-scipy)
# optdepends=('python-numba: for numba_helpers support')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e7840e950ad1fcdd3c64afc409710125e960922bde971a7d8d3a9b7da319cd4999e679a6e11dd071a65cb0b83769b13ab997f83bf7230e4dcbe703128dfe8724')

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
