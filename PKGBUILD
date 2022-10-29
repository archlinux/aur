# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.7.6.6
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python)
makedepends=(python-setuptools)
optdepends=('python-dill: for serialization support')
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('563eb6a52c017266a2af0fb8f180d420e3bdd74736bf6d66e817c9fa4fdcce27585a39b79b0cb43639f1283050a262fcd4eed6720b7651ede0475e8c663324f8')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
