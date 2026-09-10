# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sympde
pkgname=python-${_base,,}
pkgdesc="Symbolic calculus for partial differential equations"
pkgver=0.20.0
pkgrel=1
arch=(any)
url="https://github.com/pyccel/${_base}"
license=(MIT)
depends=(python-sympy python-h5py python-pytest python-yaml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('64a5f458744d91efe68ec1fe6997fcbb675e1dc7b1da00745dcdf69fb27a403e7bf6c5e00bcae13f8450db066067d6a7d683a486b52144fd5354d731b7cb76b6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
