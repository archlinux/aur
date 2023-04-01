# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchcde
pkgname=python-${_base}
pkgdesc="Differentiable controlled differential equation solvers for PyTorch with GPU support and memory-efficient adjoint backpropagation"
pkgver=0.2.5
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache)
depends=(python-torchdiffeq python-torchsde)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('973a076b03e934f9af1cb9e13bb68cb8971d6e66ea336eb17fa30b56e82992043adc0496c81f9a9890fd48d832001fdd127070a2791e2e33e7fc4a877185c3c3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
