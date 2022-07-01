# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=geotiler
pkgname=python-${_base}
pkgdesc="Library to create map using tiles from a map provider"
pkgver=0.14.6
pkgrel=1
arch=(any)
url="https://github.com/wrobell/${_base}"
license=(MIT)
depends=(python-pillow python-cytoolz python-aiohttp)
makedepends=(python-setuptools)
checkdepends=(python-pytest-cov python-numpy)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('9a5462186e5abe772cc674df4f665f151a7999e748474f9b43599b9f38ab80b60d1b1f9fa7dbe42dc0821ab617097b61cc85a9638cb741d8c7cc0be19f8cc50f')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
