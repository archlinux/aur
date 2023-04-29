# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="PyTorch-like neural networks in JAX"
pkgver=0.10.3
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('94934dae7aa76bcab0ad9dbddf18ed28ff2326b97f6aa52d6e3cdd36ffb7def6285e653649ac0ca5002742580ee55cace121919d9e0a946390d2f50a41fcf67e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
#   test-env/bin/python -m pytest ${_base}-${pkgver}/tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
