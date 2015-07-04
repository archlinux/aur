# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>

_gitname=mipp

pkgname=python2-mipp
pkgrel=2
pkgver=v0.3.137.gb4b23a6
pkgdesc="Meteorological Ingest-Processing Package (MIPP)"
arch=('any')
url="https://mipp.readthedocs.org/"
license=('LGPL3')
depends=('python2')
makedepends=('git')
source=(git://github.com/loerum/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  python2 setup.py build_ext --inplace
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
