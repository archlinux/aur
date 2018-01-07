# $Id: PKGBUILD 114894 2014-07-04 15:29:05Z fyan $
# Maintainer: Chris Brannon <chris@the-brannons.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-flup
pkgname=python2-flup
pkgver=1.0.2
pkgrel=5
pkgdesc='A collection of Python WSGI modules'
arch=('any')
url='http://trac.saddi.com/flup'
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python-flup<=1.0.2-3')
replaces=('python-flup<=1.0.2-3')
source=("http://www.saddi.com/software/flup/dist/flup-$pkgver.tar.gz"
        'LICENSE')
md5sums=('24dad7edc5ada31dddd49456ee8d5254'
         '2b61db5f66aad3b1748085e146603bd1')

package_python2-flup() {
  cd "$srcdir/flup-$pkgver"

  # python2 fix
  for file in flup/server/*.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir"

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
