# $Id$
# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>

pkgname=python2-oauth2client1412
pkgver=1.4.12
pkgrel=1
pkgdesc='A client library for OAuth 2.0'
arch=('any')
url=https://github.com/google/oauth2client
license=('Apache')
makedepends=('python2-setuptools' 'python2-httplib2' 'python2-pyasn1'
             'python2-pyasn1-modules' 'python2-rsa' 'python2-six')
optdepends=('python2-gflags: for oauth2client.tools.run function')
source=("https://pypi.python.org/packages/source/o/oauth2client/oauth2client-$pkgver.tar.gz")
md5sums=('829a05a559b43215d67947aaff9c11b5')

prepare() {
  cd oauth2client-$pkgver

  sed -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd oauth2client-$pkgver
  python2 setup.py build
}

package() {
  cd oauth2client-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/lib/python2.7/site-packages/oauth2client{,1412}
}
