# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-scimath
pkgver=4.1.2
pkgrel=1
pkgdesc="Scientific and Mathematical calculations"
arch=('i686' 'x86_64')
url="https://github.com/enthought/scimath"
license=('BSD')
depends=('python2-scipy' 'python2-traits')
makedepends=('python2-distribute')
conflicts=('python2-scimath-git' 'python-ets-scimath-svn')
options=(!emptydirs)

source=("https://github.com/enthought/scimath/archive/${pkgver}.tar.gz")
md5sums=('e21f52ff91b2aaa582dc3276f51245a1')

build() {
  cd "$srcdir"/scimath-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/scimath-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

