# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
makedepends=(cmake python-setuptools pybind11)
depends=(dolfinx python-mpi4py)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('20ea24be431f9bffc509e9e40866b8ddfe8dece09f7e0e6c18ffc5d7fb6e813de17d4f193f4bcf397b3c6e80e8576afc951c372e345702c017c444d79f45ef1a')

build() {
  cd ${_base}-${pkgver}/python
  export PYTHONHASHSEED=0
  source /etc/profile.d/petsc.sh
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
