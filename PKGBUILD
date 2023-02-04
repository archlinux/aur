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
sha512sums=('9be15ed8b653dc859a2cecc3809049c2c7746aa1d2a87c382c625be5bf7a0cc6eb30780ead2eec01c7f8f1c5fe30cd00b53edea66e0074fb479130833db88f53')

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
