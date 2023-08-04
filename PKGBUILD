# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-equinox)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fc7ff1cbdae9987e9697915e89f0e49d005912e88e471a6cce579d8293f703ffa3227c36c507764c1c15910d4a833edf1b47331e64fa2b7400a4e4a383fb5ef3')

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
