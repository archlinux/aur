# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=pathos
pkgname=python-${_base}
pkgdesc="parallel graph management and execution in heterogeneous computing"
pkgver=0.2.9
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-dill python-ppft python-pox python-multiprocess)
makedepends=(python-setuptools)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('56469bf955bc095a8f9b501110d03c09c1e16f7317626fe506269c607c006be1c6e93c9221b4af7144e0bc277dd1d68487b648d216de919f24d3c1d9fe21f0fb')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
