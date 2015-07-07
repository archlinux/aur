# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-encore
pkgver=0.6.0
pkgrel=1
pkgdesc="A collection of core-level utility modules"
arch=('any')
url="https://github.com/enthought/encore"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/enthought/encore/archive/$pkgver.tar.gz")
md5sums=('c7935d4d8803a489892ec98e1594d64e')

prepare() {
  cd "$srcdir/encore-$pkgver"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find -name '*.py')
}

build() {
  cd "$srcdir/encore-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/encore-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

