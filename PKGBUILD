# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.23.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-sympy python-scipy python-numba python-matplotlib python-tqdm)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-h5py python-pandas napari)
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'napari: for displaying images interactively'
  'python-ipywidgets: for interactive widgets'
  'python-numba-mpi: for njittable MPI wrapper')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d5c53c861810a32ec1a36e52daf57708e1fc2c508adf6359426cf59c504507a5b2e44467d500f79fba075490aea55099139b7f29dfd4f00e072aaf6c34812394')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}/tests
#   MPLBACKEND=Agg NUMBA_WARNINGS=1 python run_tests.py --unit # --use_mpi
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
