# $Id: PKGBUILD 114894 2014-07-04 15:29:05Z fyan $
# Maintainer: Chris Brannon <chris@the-brannons.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-flup
pkgname=('python2-flup' 'python-flup')
pkgver=1.0.3
pkgrel=1
pkgdesc='A collection of Python WSGI modules'
arch=('any')
url='https://www.saddi.com/software/flup/'
license=('MIT')
makedepends=('python2-distribute' 'python-distribute')
source=("https://pypi.python.org/packages/source/f/flup/flup-${pkgver}.tar.gz"
        'LICENSE')
md5sums=('a64e7a6374e043480ee92534c735964e'
         '2b61db5f66aad3b1748085e146603bd1')

prepare() {
  rm -rf -- "${srcdir}/flup-${pkgver}-py2"
  cp -a -- "${srcdir}/flup-${pkgver}"{,-py2}

  cd "$srcdir/flup-$pkgver-py2"
  # python2 fix
  for file in flup/server/*.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
}

package_python-flup() {
  depends=('python')
  cd "$srcdir/flup-$pkgver"

  python setup.py install --root="$pkgdir"

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-flup() {
  depends=('python2')
  cd "$srcdir/flup-$pkgver-py2"

  python2 setup.py install --root="$pkgdir"

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
