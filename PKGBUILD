# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=2.2.0
pkgrel=1
pkgdesc="Python automated machine learning framework"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-scikit-learn python-typer python-loguru)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2ea4cf9ada52a94cdd1ce0cb5c8624fd68f1f56518d71940fae86eba75b9ecc87f7e00bc9da472c7f1204905e65bc11440a67e8083331442bd8ac04637fb7f9e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
