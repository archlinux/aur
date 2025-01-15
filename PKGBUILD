# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
# Contributor: kewl
_base=eth-hash
pkgname=python-${_base}
pkgver=0.7.1
pkgrel=1
pkgdesc="The Ethereum hashing function, keccak256, sometimes (erroneously) called sha256 or sha3"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-pycryptodome)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('06da00ec4d73c67525c9eeabac98e6fce99fe8a5d6dbd2e7a2fdcfd8d9b72c8914782129cc120d07ad3918750a2f18bd7a44ea3b4c3f347fcc2486c35e5ab9b8')

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
