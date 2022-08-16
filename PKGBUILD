# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.21.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-sympy python-scipy python-numba python-matplotlib)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-h5py python-pandas python-tqdm napari)
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'python-tqdm: for display progress bars during calculations'
  'napari: for displaying images interactively')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('11c446c66a7f9f8bfe274bddede03e2f67f7bf401d4fed894c5684dbd6e0397cca29484086cfdad74ee22d12a70c9c8e47ccff80ca9395e7d6400a3debafdf06')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}/tests
#   MPLBACKEND=Agg NUMBA_WARNINGS=1 python run_tests.py --unit
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
