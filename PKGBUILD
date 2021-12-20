# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.17.1
pkgrel=1
arch=('any')
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-sympy python-scipy python-numba python-matplotlib)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-h5py python-pandas python-tqdm napari)
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'python-tqdm: for display progress bars during calculations'
  'napari: for displaying images interactively')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e99d8845702a3439226b113b882427d076d37f78a24b3f55105c25ad18c069fe6b59575a8bac1a8250cff87b3eb40e88c80e7c4d02fd327fd48009fa5c571d77')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}/tests"
#   MPLBACKEND=Agg NUMBA_WARNINGS=1 python run_tests.py --unit
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
