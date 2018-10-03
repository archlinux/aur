# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>
_pkgname=requests-aws4auth
pkgname=python2-$_pkgname
pkgver=0.9
pkgrel=1
pkgdesc="Amazon Web Services version 4 authentication for the Python Requests module."
arch=(i686 x86_64)
url=https://github.com/sam-washington/requests-aws4auth
license=('MIT')
depends=('python2' 'python2-requests')
source=(https://github.com/sam-washington/requests-aws4auth/archive/$pkgver.tar.gz)
sha512sums=('cf378f3ac97fe44000c17c15a5d75774e95dd9ddab7f4d550f676505de1641df79b0209750c376d51e9e49c7114b2b6891e292ab3e55313ee127c924217fe8a2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

# vim:set ts=2 sw=2 et:
