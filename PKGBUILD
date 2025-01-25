# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=2.1.2
pkgrel=1
pkgdesc="Python automated machine learning framework"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-scikit-learn python-typer python-loguru)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('3c574ee98ec0865684ef87e790d9f4139dd5fd7f97854233bace108058bb590d19faaf14b80dfe62d1bd4e75eb420b2d33b869c751d724630c4e40c5ae9f98cc')

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
