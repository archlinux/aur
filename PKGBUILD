# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CUQIpy
pkgname=python-${_base,,}
pkgdesc="Computational Uncertainty Quantification for Inverse problems in Python"
pkgver=1.5.0
pkgrel=1
arch=(any)
url="https://github.com/${_base::4}-DTU/${_base}"
license=(Apache-2.0)
depends=(python-matplotlib python-scipy python-arviz python-tqdm)
makedepends=(python-build python-installer python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('90b46aa1c089abef788b3f1887079f151c766c426ac1c453b42acba1e398c8a0dbc6e59776e32a5d940ba6e2a04b90f9d10701af1e203c20e48843c5818b22e3')

build() {
  cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
