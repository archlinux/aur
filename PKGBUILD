# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>

pkgname=opendict
pkgver=0.6.6
pkgrel=1
pkgdesc="Multiplatform computer dictionary software"
arch=('any')
url="http://opendict.idiles.com/"
license=('GPL')
depends=('wxpython' 'xdg-utils')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('2909fe7ebdcc8bba869c9ca24dbbe086')


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
