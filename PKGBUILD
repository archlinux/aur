# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.2.8
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-mystic: for mystic models')
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('f8c3a7d66fdac874301eeeb5422c538066ac08b8cb7643b3dcfea3b4578b6ae5c23e8089fd4d60eb179bbcd9804763d49685ae1308ec0985fb877927461a8380')

build() {
  cd ${_base}-${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest ${_base}/tests
# }

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
