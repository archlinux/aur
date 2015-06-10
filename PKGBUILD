# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=pybtex-bzr
pkgver=836
pkgrel=1
pkgdesc="Pybtex reads citation information from a file and produces a formatted bibliography."
arch=('any')
url="https://code.launchpad.net/pybtex"
license=('GPL')
makedepends=('python2' 'bzr')
depends=('python2')
conflicts=('python2-pybtex')
provides=('python2-pybtex')
source=("pybtex::bzr+lp:pybtex")
md5sums=('SKIP')

build() {
  cd ${srcdir}/pybtex
  # Replace python with python2
  for file in $(find $srcdir/$_bzrname -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd ${srcdir}/pybtex
  python2 setup.py install --prefix'=/usr' --root="${pkgdir}"
}
# vim:ts=2:sw=2:et:

