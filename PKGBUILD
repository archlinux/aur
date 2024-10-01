# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyina
pkgname=python-${_base}
pkgdesc="MPI parallel map and cluster scheduling"
pkgver=0.3.0
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=(BSD-3-Clause)
depends=(python-numpy python-mpi4py python-pathos)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-mystic: for mystic models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1cfeabef389f881c56a4fecfe1dee3d5145c2260324fbd179cc0df8b8bc4bee8032761bb002d952ae31864eeba92070417e07e79c36409dd3b879c0ac18488c7')

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
