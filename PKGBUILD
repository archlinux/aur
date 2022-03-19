# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
_base=singledispatch
pkgname=python2-${_base}
pkgver=3.7.0
pkgrel=1
pkgdesc="Implementation of functools.singledispatch from Python 3.4"
arch=(any)
url="https://github.com/jaraco/singledispatch"
license=(MIT)
depends=(python2-six)
makedepends=(python2-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0ec8503c188dd095eaab6e07147aad8dc7863c51d746fbc19086fb434ca1a48c65fa2219110f3d530a8370242f6df72e59fbf451ec4ce7ba49b751fb5c097c34')

prepare() {
  cd ${_base}-${pkgver}
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${srcdir}" -name '*.py')
}

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
