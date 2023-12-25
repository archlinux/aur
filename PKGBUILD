# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=FireflyAlgorithm
pkgname=python-${_base,,}
pkgdesc="Implementation of Firefly Algorithm in Python"
pkgver=0.4.4
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f0060bcfabb3cff94bc64ac32bda64bc8fc002187375488d1b3c33d3b103cd6da712c8abfe291510fb3a433b8a087a9bee3ea0d6b1297ee5583c2a90a5b1a904')

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
