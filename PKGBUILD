# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colormaps
pkgname=python-${_base}
pkgdesc="Collection of colormaps or color palettes for Python"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/pratiman-91/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ecd270c992ea5b9e34393e2f1a5a2f0b32d56d65f480786edea348b76143e048c0ac1379d07e9fe8ec7d7753d47c31e321f82c1d4f309028d8a00cb7042a5498')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
