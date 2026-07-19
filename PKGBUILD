# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sympde
pkgname=python-${_base,,}
pkgdesc="Symbolic calculus for partial differential equations"
pkgver=0.19.3
pkgrel=1
arch=(any)
url="https://github.com/pyccel/${_base}"
license=(MIT)
depends=(python-sympy python-h5py python-pytest python-yaml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c4260318b77431250e21b5eb4a71717f2d5f3c1cabd7ffb5076beb25802b241a753ab44c4e6ba1e04c3fc30c07ef02c9b129fc5a971c6b4b41d82e70966ad3c9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
