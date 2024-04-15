# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lineax
pkgname=python-${_base}
pkgdesc="Linear solvers in JAX and Equinox"
pkgver=0.0.5
pkgrel=1
arch=(any)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(python-equinox)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2b6573b37b54a97a8d45b6c0306a348eff5ff3426102ced40e1710c4b032ad872d70363385fe07bc1f74ffa2bf667f6ef95c420b71de7a9aefba0e8390a6c56')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
