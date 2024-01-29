# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.2.9
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-mystic: for mystic models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4e006738f0ab528131e7d9bb3b9f598eac45c377ed4a215f10e8e416ac6fbe534e4d1bc2a7e48b4902c75d6bb7419ca8a8e0e5fab8a3b3e7f3a11231971903b3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest ${_base}/tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
