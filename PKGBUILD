# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CUQIpy
pkgname=python-${_base,,}
pkgdesc="Computational Uncertainty Quantification for Inverse problems in Python"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/${_base::4}-DTU/${_base}"
license=(Apache-2.0)
depends=(python-matplotlib python-scipy python-arviz python-tqdm)
makedepends=(python-build python-installer python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('419c83a500d4e8741382c195d6eb50a8e96ba39643ec0bf3cfa45d07090b344296a074dd85775dda14d6636942cd2ae756698a33166e412f1435160fc653680e')

build() {
  cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
