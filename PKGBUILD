# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.22.1
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-sympy python-scipy python-numba python-matplotlib python-tqdm)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-h5py python-pandas napari)
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'python-tqdm: for display progress bars during calculations'
  'napari: for displaying images interactively')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('52a362b68cdfa85c8f93e63aa5267b9141de97ddcdd6a60cd54e6710a26e977299621d5422938dbc9b5347d14c5ca9647dbf467401f398fee1809c1d2ba095f5')

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
