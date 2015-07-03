# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=snakefood-hg
_pkgname=snakefood
pkgver=286
pkgrel=2
pkgdesc="Generate dependency graphs from Python code"
arch=('any')
url="http://furius.ca/snakefood/"
license=('GPL')
depends=('python2-six')
makedepends=('mercurial')
optdepends=('graphviz: generate dependency graphs')
provides=('snakefood')
conflicts=('snakefood')
source=("hg+https://bitbucket.org/blais/snakefood")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(hg identify -n)
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' lib/python/snakefood/checker.py
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
