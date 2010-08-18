# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=python-soappy
pkgver=0.12.0
pkgrel=9
pkgdesc="A module which implements a high-level interface to SOAP functions"
arch=('any')
url="http://pywebsvcs.sourceforge.net/"
license=('custom')
depends=('python-fpconst' 'pyxml')
optdepends=('python-m2crypto: for support for server-side SSL')
source=(http://downloads.sourceforge.net/pywebsvcs/SOAPpy-${pkgver}.tar.gz)
md5sums=('d0d29f9b6fb27bfadc69b64a36321e20')

build() {
  cd "${srcdir}/SOAPpy-${pkgver}"
  sed -i "s/from __future__ import nested_scopes/#\0/g" SOAPpy/*.py
  python2 setup.py build
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for f in c14n.py Namespaces.py logging.py __init__.py; do
      sed -e 's|#! /usr/bin/env python|#!/usr/bin/env python2|' \
          -i ${pkgdir}/usr/lib/python2.7/site-packages/SOAPpy/wstools/${f}
  done
}
