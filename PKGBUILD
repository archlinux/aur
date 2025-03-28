# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lineax
pkgname=python-${_base}
pkgdesc="Linear solvers in JAX and Equinox"
pkgver=0.0.8
pkgrel=1
arch=(any)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(python-equinox)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c66a063e343787e7db0f22a3dbfd2cbcfa10e8744b476c37c1cecac7b690c68aedfb54eec3a2bb180dc32de45b1e6daf6096d7a1c0ea25b868a83b3bdab31375')

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
