# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lineax
pkgname=python-${_base}
pkgdesc="Linear solvers in JAX and Equinox"
pkgver=0.0.4
pkgrel=1
arch=(any)
url="https://github.com/google/${_base}"
license=(Apache)
depends=(python-equinox)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('27129eb04fd1ab41f50b07fc18f91040d86419d67901fba23bd66221fabd659d5f47a90f35dfd387b09ba71ca4f0062bf9a4e4b0cfa252ec5d523e87321e53d8')

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
