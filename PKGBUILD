# Contributor: Andrew Chen <xor.tux@gmail.com>
pkgname=python-cstruct
pkgver=2.1
pkgrel=1
pkgdesc="Convert C struct definitions into Python classes with methods for serializing/deserializing"
url="https://github.com/andreax79/${pkgname}"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c56c87d291c4aa2afcfdbcbbc19c03ec634b6fb0dcde9d516ef2a9079be2fea52a053c47cd20dfc0fe6537ac90939364da659d8eb4763069a9990681207d432c')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
