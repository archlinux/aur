# $Id$
# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>

pkgname=python2-oauth2client1412
pkgver=1.4.12
pkgrel=3
pkgdesc='A client library for OAuth 2.0'
arch=('any')
url=https://github.com/google/oauth2client
license=('Apache')
makedepends=('python2-setuptools' 'python2-httplib2' 'python2-pyasn1'
             'python2-pyasn1-modules' 'python2-rsa' 'python2-six')
optdepends=('python2-gflags: for oauth2client.tools.run function')
source=("https://pypi.python.org/packages/source/o/oauth2client/oauth2client-$pkgver.tar.gz"
        'patch')
sha256sums=('74aa6c3beb90a4a7b9b8d0bc3cd60db34d45c5ee6136187bb9eabe85b4990e5e'
            'd2c5570dc10da6bb4a20dc9a082d783e73ae36a6388538ff0e05f4e440bea925')

prepare() {
  cd oauth2client-$pkgver
  patch -p1 <../patch
  sed -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" -i oauth2client/util.py
  mv oauth2client{,1412}
}

build() {
  cd oauth2client-$pkgver
  python2 setup.py build
}

package() {
  cd oauth2client-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
