# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-visvis
pkgver=1.9
pkgrel=1
pkgdesc="A pure Python library for visualization of 1D to 4D data in an object oriented way"
url="http://code.google.com/p/visvis/"
arch=('any')
license=('BSD')
depends=('python2-numpy' 'python2-opengl')
makedepends=('python2-distribute')
optdepends=('python2-pyqt4: for Qt4 backend'
            'python2-pyside: for another Qt4 backend'
            'python2-wxpython: for WxWidgets backend'
            'pygtk: for GTK backend'
            'pyfltk: for FLTK backend')
source=(http://visvis.googlecode.com/files/visvis-$pkgver.zip license)
md5sums=('6b90244c3dd52514f48a57da2cf11a31'
         '2dd246a9746e31c0ab2a512bbc114baf')

build() {
  cd "${srcdir}"/visvis-$pkgver

  python2 setup.py build
}

package() {
  cd "${srcdir}"/visvis-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "${srcdir}"/license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

