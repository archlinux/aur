#Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
pkgname=python2-rpclib
_pkgname=rpclib
pkgver=2.8.0
pkgrel=2
pkgdesc="A transport and architecture agnostic rpc (de)serialization library that focuses on making small, rpc-oriented messaging work"
arch=('any')
url="http://github.com/arskom/rpclib"
license=('LGPL')
depends=('python2-pytz' 'python2-lxml')
optdepends=('mod_wsgi')
source=(https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}-rc.tar.gz)
sha256sums=('846d46bc6ffff23a3c8382df45dce5ac2e7d889ce1904d2b394864d21cf329c1')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}-rc
  sed "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -i rpclib/test/sort_wsdl.py
  sed "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-rc
  python2 setup.py install --root=${pkgdir}/
}
