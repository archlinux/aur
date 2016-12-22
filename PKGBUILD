# Maintainer: Rich Lindsley <richli.ff at gmail dot com>
pkgname=python2-bufr
_py_pkgname=python-bufr # The pypi package name
pkgver="0.2.5"
_py_pkgver="0.2-5" # the official version has a hyphen
pkgrel=3
pkgdesc="Generic Python BUFR file reader based on ECMWF BUFR library"
arch=('i686' 'x86_64')
url="https://github.com/pytroll/python-bufr"
license=('GPL3')
depends=('python2')
makedepends=('python2-numpy' 'eccodes')
options=(!emptydirs)
source=(https://github.com/pytroll/python-bufr/archive/v0.2-5.tar.gz)
md5sums=('78cb04b43e61d7c097a0b8f8c805ab3f')

build() {
  cd "$srcdir/$_py_pkgname-$_py_pkgver/bufr"

  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  sed -i setup.py -e 's/libraries = \[\x27bufr/libraries = \[\x27eccodes/'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_py_pkgname-$_py_pkgver/bufr"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
