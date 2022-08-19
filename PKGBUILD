# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.5.0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
depends=(dolfinx python-mpi4py)
makedepends=(cmake python-setuptools pybind11)
optdepends=('gmsh: for extract data from Gmsh models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9bb93c155ca16386934e2643e8afa93fbbc5ffaf2fdf176013cf1eb4bad702a2d2b424568ac41dbe87a43d872fccc2eea66508fafd287748a99c5632c6b76e97')

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
