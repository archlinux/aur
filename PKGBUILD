# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CUQIpy
pkgname=python-${_base,,}
pkgdesc="Computational Uncertainty Quantification for Inverse problems in Python"
pkgver=1.4.1
pkgrel=1
arch=(any)
url="https://github.com/${_base::4}-DTU/${_base}"
license=(Apache-2.0)
depends=(python-matplotlib python-scipy python-arviz python-tqdm)
makedepends=(python-build python-installer python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e00481597e2bc5422ab373a10ee6ee0f97f145d3e679fcb1668c9cc9f5e0c45b801c1384c70152984e808fcc671fbe2a6b22c43911ebe053d71102028dfb1469')

build() {
  cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
