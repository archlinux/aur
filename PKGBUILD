# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=equinox
pkgname=python-${_base}
pkgdesc="PyTorch-like neural networks in JAX"
pkgver=0.10.2
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-jax python-jaxtyping python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('056ff41e3bfaeede0ebe3e6a645884c15e4fc93054582834b58a2a9e7de5be0c16dcd3e339bfd12daa0dd0f70e2a4c924896b719b85bdd6878100af19725be3f')

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
