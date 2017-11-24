# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>

pkgname=opendict
pkgver=0.6.8
pkgrel=1
pkgdesc="Multiplatform computer dictionary software"
arch=('any')
url="http://opendict.sourceforge.net/"
license=('GPL')
depends=('wxpython' 'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/nerijus/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('0802d2b1b05ac477339084f3cdda6b3f')


prepare() {
  cd $pkgname-$pkgver

  # python2 fix
  sed -i 's_/usr/share/doc/packages/python_/usr/lib/python2.7_g' po/Makefile
  sed -i 's_python _python2 _' po/Makefile
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' opendict.py
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir/usr install

  # Fix makefile symlink
  cd $pkgdir/usr/bin
  ln -sf ../share/opendict/opendict.py opendict
}
