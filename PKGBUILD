# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CUQIpy
pkgname=python-${_base,,}
pkgdesc="Computational Uncertainty Quantification for Inverse problems in Python"
pkgver=1.5.1
pkgrel=1
arch=(any)
url="https://github.com/${_base::4}-DTU/${_base}"
license=(Apache-2.0)
depends=(python-matplotlib python-scipy python-arviz python-tqdm)
makedepends=(python-build python-installer python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('816bd36897accf98dd5e0fb8f3d059e119ab73aacf19d1889da5fe314eca29dd2b350c92fa1d4d7cbe42c47909cd112d0e9a7f336de121329d4093cab2cb346f')

build() {
  cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
