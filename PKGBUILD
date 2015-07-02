# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=python2-pygraphviz
_realname=pygraphviz
pkgver=1.2
pkgrel=1
pkgdesc='PyGraphviz is a Python interface to the Graphviz graph layout and visualization package.'
arch=('i686' 'x86_64')
license=('LGPL')
url="https://networkx.lanl.gov/pygraphviz"
depends=('python2>=2.4' 'graphviz')
conflicts=('pygraphviz' 'python-pygraphviz')
replaces=('pygraphviz' 'python-pygraphviz')
provides=('pygraphviz' 'python-pygraphviz')

source=(http://pypi.python.org/packages/source/p/${_realname}/${_realname}-$pkgver.tar.gz)
md5sums=('dbe3fa55e59a5d7e3bd924511b3275c4')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;
}
