# Maintainer: Michael Duell <michael.duell@rub.de> PGP: 0xF32C939C5566FF77

pkgname=python2-potr
pkgver=1.0.1
pkgrel=3
pkgdesc="This is a pure Python2 OTR implementation; it does not bind to libotr."
arch=(any)
url="https://github.com/afflux/pure-python-otr"
license=('LGPL')
depends=('python2' 'python2-crypto')
conflicts=('python-potr-git' 'python-potr' 'python2-potr-git')
replaces=('python-potr')
#options=(!emptydirs)
source=("https://github.com/afflux/pure-python-otr/tarball/${pkgver}")

PYTHON=`which python2`

prepare() {
  cd $srcdir/python-otr-*
  set_python2
}

package() {
  cd $srcdir/python-otr-*
  $PYTHON ./setup.py install --root=$pkgdir/
}

# To use python2 instead of default python v3.
set_python2() {
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${file}"
  done
}


# vim:set ts=2 sw=2 et:
sha512sums=('e12823b95f166018b0aaeda8b5ca862e236d38dd165d75439ba59940001478f841cdb1e3e72f499c9222c3bb3581f4e276bcaec3e7ccb0fb026e63ed3c7ee11b')
