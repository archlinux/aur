# Maintainer: Rich Lindsley <richli.ff at gmail dot com>
pkgname=python2-bufr
_py_pkgname=python-bufr # The pypi package name
pkgver="0.2.5"
_py_pkgver="0.2-5" # the official version has a hyphen
pkgrel=2
pkgdesc="Generic Python BUFR file reader based on ECMWF BUFR library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/python-bufr/"
license=('GPL3')
depends=('python2')
makedepends=('python2-numpy' 'libbufr-ecmwf')
options=(!emptydirs)
source=(http://python-bufr.googlecode.com/files/${_py_pkgname}-${_py_pkgver}.tar.gz)
md5sums=('db8c5c5198b166e38c76aa8e78972cd1')
sha1sums=('9bfb2f9ed5af15721506f18621ac3c57d2410500')
sha256sums=('883f3e1aa8a2900b17c216fc2ce04154b40ee297f7bc1dbbd6794d95ad244101')


build() {
  cd "$srcdir/$_py_pkgname-$_py_pkgver"

  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  python2 setup.py build
}

package() {
  cd "$srcdir/$_py_pkgname-$_py_pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
