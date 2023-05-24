# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-equinox)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-psutil python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0ac5afed8e49d35843f2b9234dcb7bc3f7fb394a9fe983cd4ae6c2cc12983186b6f40d33389cd1beab6ee5a4cae79d928dd66dda9d3a7e30588eca8a24668a16')

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
