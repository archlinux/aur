# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=geotiler
pkgname=python-${_base}
pkgdesc="Library to create map using tiles from a map provider"
pkgver=0.14.7
pkgrel=1
arch=(any)
url="https://github.com/wrobell/${_base}"
license=(MIT)
depends=(python-pillow python-cytoolz python-aiohttp)
makedepends=(python-setuptools)
checkdepends=(python-pytest-cov python-numpy)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('fcb13853ced62af9489d50038acaad8c7fce5f7a3db55c7e0bac70d2318d490217f781116e0a34428d3414d1a9af36ac494c12b2e6eddc8e6ba4db1e8bc03379')

build() {
  cd ${_base}-${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
