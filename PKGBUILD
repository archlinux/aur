# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python2-numexpr
pkgver=2.6.9
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python, NumPy, PyTables, pandas"
url="https://github.com/pydata/numexpr"
arch=('x86_64')
license=('MIT')
makedepends=('python2-setuptools' 'python2-numpy')
source=($pkgname-$pkgver.tar.gz::https://github.com/pydata/numexpr/archive/v$pkgver.tar.gz)
sha1sums=('db6cbb412fb1f85f87814002b88d0e479cf3ac51')

prepare() {
  cd "$srcdir/numexpr-$pkgver"

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/numexpr-$pkgver
  python2 setup.py build
}

package() {
  depends=('python2-numpy')

  cd "$srcdir"/numexpr-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
