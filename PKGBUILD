# Maintainer: Bennett Goble <nivardus@gmail.com>
# Partial Maintainer: Alex Tharp <toastercup@gmail.com>

pkgname=autobuild
pkgver=1.0.1
pkgrel=1
pkgdesc='Linden Lab Automated Package Management and Build System'
arch=('any')
url='http://wiki.secondlife.com/wiki/Autobuild'
license=('MIT')
depends=('python2' 'python2-pydot' 'llbase')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/a/autobuild/autobuild-${pkgver}.tar.gz)
sha1sums=('4afd82d9e5c21974a7cbbbcc93a7e00939d49f3c')

build() {
  cd $srcdir/autobuild-${pkgver}

  sed -i "s|pydot2|pydot|" $srcdir/autobuild-${pkgver}/setup.py
  python2 setup.py install --root=$srcdir/autobuild-${pkgver}/build --optimize=1
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $srcdir/autobuild-${pkgver}/build -name '*.py')
}

package() {
  cp -a $srcdir/autobuild-${pkgver}/build/usr $pkgdir
}

