# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Missing complement to Python"
pkgver=1.15.2.0
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-optype)
makedepends=(python-build python-installer python-hatchling)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('95e20d4f1912a3f5d4bff22ed46f594b3e6f1b8030bb70ce908717eb82debbbb10521d3c39b27ec0f500f65a4cb0191885f5966bcbc43d62c211b73201fc580b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
