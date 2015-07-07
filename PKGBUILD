# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-chaco
pkgver=4.5.0
_githubtag=5814003
pkgrel=1
pkgdesc="Interactive 2-Dimensional Plotting"
arch=('i686' 'x86_64')
url="https://github.com/enthought/chaco"
license=('BSD')
depends=('python2-enable')
makedepends=('python2-setuptools')
options=(!emptydirs)

source=("https://github.com/enthought/chaco/tarball/${pkgver}")
md5sums=('c28f63e4ec29c313efc40a21bb9ddc45')

prepare() {
  cd "$srcdir/enthought-chaco-${_githubtag}"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${srcdir}" -name '*.py')
}

build() {
  cd "$srcdir/enthought-chaco-${_githubtag}"

  python2 setup.py build
}

package() {
  cd "$srcdir/enthought-chaco-${_githubtag}"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

