# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
# Contributor: kewl
_base=eth-hash
pkgname=python-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="The Ethereum hashing function, keccak256, sometimes (erroneously) called sha256 or sha3"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-pycryptodome)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8e3821be3a646f4eb6d76b844693ac0db742b6361cd3a8641e3441bb04bd5bee7a96b09aa5cc2077bf868387bb8f5f8e3f56952cc11006eeb8c379bed9805add')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
