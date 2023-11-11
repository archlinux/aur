# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=FireflyAlgorithm
pkgname=python-${_base,,}
pkgdesc="Implementation of Firefly Algorithm in Python"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('07727edddd6a60f79862a48b2f1b781e9b78bfa6610847055865cd09a42ff0ee1ef04b0d6801cc0de1063c01bcd646c8d7ccbbc256e9c71b3a2123e161f1330e')

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
