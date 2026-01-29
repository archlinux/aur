# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lineax
pkgname=python-${_base}
pkgdesc="Linear solvers in JAX and Equinox"
pkgver=0.1.0
pkgrel=1
arch=(any)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(python-equinox)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('22240e39528d0e5c2d7e05a24fb3ef8105d4a2fa3cf7c8b33246fbdb2e79f6eacaf80480a96a7d93625ba3a214c59f1e07edde93c929dbfe167f7f3d256d8e78')

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
