# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-blockcanvas
pkgver=4.0.3
pkgrel=1
pkgdesc="Visual Environment for Creating Simulation Experiments"
arch=('i686' 'x86_64')
url="https://github.com/enthought/blockcanvas"
license=('BSD')
depends=('python2-codetools' 'python2-apptools' 'python2-chaco'
         'python2-etsdevtools' 'python2-scimath')
makedepends=('python2-distribute' 'gcc')
conflicts=('python2-blockcanvas-git' 'python-ets-blockcanvas-svn')
options=(!emptydirs)

source=("https://github.com/enthought/blockcanvas/archive/${pkgver}.tar.gz")
md5sums=('31e722b31a92dea0d68cbc8138db7b59')

build() {
  cd "$srcdir"/blockcanvas-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/blockcanvas-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

