# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=diffrax
pkgname=python-${_base}
pkgdesc="GPU+autodiff-capable ODE/SDE/CDE solvers written in JAX"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-equinox)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-optax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2b3fd7beaec760d68cf345658a208e379de5e066e7f660c5c903828cc415347981660a4f5ff7ec6286620caf17fba22f57d9acf7ad865e347fe629c4e4e8ab7a')

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
