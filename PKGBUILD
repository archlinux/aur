# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
makedepends=(cmake python-setuptools pybind11)
depends=(dolfinx python-mpi4py)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b0824e48ad2ea23db7ca93af390891a09bd6a975f28501fc870dcf555d951764625b04614d4c28eeecb690bb95e9443ba6be52ae4e31ea51c5475fdd7710c56b')

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
