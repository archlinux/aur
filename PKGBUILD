# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=einsumt
pkgname=python-${_base}
pkgdesc="Multithreaded version of numpy.einsum function"
pkgver=0.9.3
pkgrel=1
arch=(any)
url="https://github.com/mrkwjc/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f2d3b1a5ccad3c8982722841c33db1e1fe8dc78b237f870991e783b99d6b04e33c4a6b5f0ecb3baa5fa3228cb8cfbccef580b3f07391c0e4247a3b8181e5762b')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python test_einsumt.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
