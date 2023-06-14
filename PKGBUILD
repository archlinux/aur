# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Fabio Zanini <fabio.zanini@fastmail.fm>
_base=annoy
pkgname=python-${_base}
pkgver=1.17.3
pkgrel=1
pkgdesc="Approximate Nearest Neighbors Oh Yeah"
url="https://github.com/spotify/${_base}"
arch=('i686' 'x86_64')
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-numpy python-h5py)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('c121d38cacd98f5103b24ca4e94ca097f18179eed3037e9eb93ad70ec1e6356e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
