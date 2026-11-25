# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-matlab
pkgname=python-${_base}
pkgver=1.3.4
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(any)
url="https://github.com/acristoffers/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7958bdf854c408ff5335aa271820d60f63a3c197624ab6410c6936ac76ae5df103b2ca4aad04f4c3efcbd837818475e533d337b357a2513b4b0de63454898305')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
