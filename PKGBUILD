# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-tabulate
pkgver=0.7.5
pkgrel=1
pkgdesc="Pretty-print tabular data in Python."
arch=(any)
url="https://bitbucket.org/astanin/python-tabulate"
depends=('python2' 'python2-psutil')
source=("https://pypi.python.org/packages/source/t/tabulate/tabulate-$pkgver.tar.gz")
sha256sums=('9071aacbd97a9a915096c1aaf0dc684ac2672904cd876db5904085d6dac9810e')

build() {
  cd "$srcdir/tabulate-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/tabulate-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

# vim:set ts=2 sw=2 et:
