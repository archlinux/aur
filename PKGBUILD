# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Missing complement to Python"
pkgver=1.15.2.1
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-optype)
makedepends=(python-build python-installer python-hatchling)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3cb046568e0f66b6b89266512ca862081f62546da75d617ccf6435128f6d19736ce38261e153669764febb7971f4ffcc704eba81f88f3bfa2f808eff81746cf4')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
