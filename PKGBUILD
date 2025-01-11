# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Missing complement to Python"
pkgver=1.15.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-optype)
makedepends=(python-build python-installer python-hatchling)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b4867d1bb336b70bb9f7f7fa6efa1bc507db8b6b670de868b269c31d7b14d9028df1ea3f1fef298467df13d0449c106244230058d9a9a75d11848c3fc32708d3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
