# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-codetools
pkgver=4.2.0
pkgrel=1
pkgdesc="Code Analysis and Execution Tools"
arch=('any')
url="https://github.com/enthought/codetools"
license=('BSD')
depends=('python2-traits')
makedepends=('python2-distribute')
conflicts=('python2-codetools-git' 'python-ets-codetools-svn')
options=(!emptydirs)

source=("https://github.com/enthought/codetools/archive/${pkgver}.tar.gz")
md5sums=('bb1554c7deeb2d1821ad097344efd3eb')

build() {
  cd "$srcdir"/codetools-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/codetools-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

