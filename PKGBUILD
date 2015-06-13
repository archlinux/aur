# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python-pysmell
pkgver=0.7.3
pkgrel=4
pkgdesc="An autocompletion library for Python"
url="http://pypi.python.org/pypi/pysmell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2')
makedepends=('setuptools')
optdepends=(
  'pymacs: for emacs integration'
  'vim: for vim integration'
  )
source=(http://pypi.python.org/packages/source/p/pysmell/pysmell-${pkgver}.zip)
md5sums=('4161fa810a8e7147a35a94abfb28d9cd')

build() {
  cd ${srcdir}/pysmell-$pkgver
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
              -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
              $(find ./ -name '*.py')

  python2 setup.py build

}

package() {
  cd ${srcdir}/pysmell-$pkgver
  python2 setup.py install --prefix=/usr --root=${pkgdir}

  # create directories for the pysmell support files
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -d $pkgdir/usr/share/vim/plugin

  install -m644 $startdir/src/pysmell-$pkgver/pysmell.el -t $pkgdir/usr/share/emacs/site-lisp
  install -m644 $startdir/src/pysmell-$pkgver/pysmell.vim -t $pkgdir/usr/share/vim/plugin
}

# vim:ts=2:sw=2:et
