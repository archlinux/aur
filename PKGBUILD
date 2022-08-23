# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=5.0.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-meshio python-scipy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-sparse)
optdepends=('python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support')
#'python-einsumt: for multithreaded numpy.einsum support'
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e4defd25b4dc44f58831ddb3224d0f8ac50c591bc348a1bd26cf6bff5399c4ee596905e6e7bc9f79e06d08dde3c30ba4b53fb28a8e982294a3dc588b9d513efc')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd ${_base}-${pkgver}
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
