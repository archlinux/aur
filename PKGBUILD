# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.18.0
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
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c7a99e8e5f7ef39e92ddf0525d62ca850b673f0efbe9e20e4f31d8b8506f704c12613e666dc922bf43715b4f2dccc089e0ef210279a810114f1eaf128bc3cc05')

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
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
