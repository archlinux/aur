# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.19.2
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
sha512sums=('e829b061f570164c6e31502beb801a00920f46ef7a1f8811aba9bd8bf4b9ebd356bbea9d6a465511a8001a85016804201dec9bad40085dec6c79b8462320f3f0')

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
