# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lineax
pkgname=python-${_base}
pkgdesc="Linear solvers in JAX and Equinox"
pkgver=0.1.1
pkgrel=1
arch=(any)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(python-equinox)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('990114c9f13e10b44ca6e148426a6e72a377dc9534d8014a108ba5c77ffbd347d4044dcfe3d78fe73ae74e0e367c624179e51491d6282618ebfffc9fcdba777c')

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
