# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-client
pkgname=python-${_base}
pkgdesc="Internal client of trame"
pkgver=2.7.4
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2bed92e70ba3ce47b6d5cd07cea0e9550804e451aff190068f82ba5f4b374fed76185f2953098e2baf4088c510ff426bbe5048ee1f81ed941d4680f57fce81d1')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
