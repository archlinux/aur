# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchquad
pkgname=python-${_base}
pkgdesc="Package providing torch-based numerical integration methods"
pkgver=0.6.0
pkgrel=1
arch=(any)
url="https://github.com/esa/${_base}"
license=(GPL-3.0-or-later)
depends=(python-loguru python-matplotlib python-scipy python-tqdm python-autoray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('959c9eff443d9ac8482edddc31dbcf760a37e9a214e2f2e04dcf4dc1d3ad00f8b0c0b0d7b7337a2b04ab08de5a9ee2443aee729c6a3250aea7071fbc3812e459')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
