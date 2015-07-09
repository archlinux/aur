# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>

pkgname=opendict
pkgver=0.6.3
pkgrel=4
pkgdesc="Multiplatform computer dictionary software"
arch=('any')
url="http://opendict.idiles.com/"
license=('GPL')
depends=('python2>=2.3' 'wxpython' 'pyxml' 'gettext>=0.14')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://opendict.idiles.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('2426a1de1131d0279dcea0cded43b063')
icondir=share/icons/hicolor

build() {
  mkdir -p $startdir/pkg/usr/$icondir/24x24/apps
  mkdir -p $startdir/pkg/usr/$icondir/32x32/apps
  mkdir -p $startdir/pkg/usr/$icondir/48x48/apps
  mkdir -p $startdir/pkg/usr/$icondir/96x96/apps
  mkdir -p $startdir/pkg/usr/$icondir/scalable/apps
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/applications
  cd $startdir/src/$pkgname-$pkgver
 
  # python2 fix 
  sed -i 's_/usr/share/doc/packages/python_/usr/lib/python2.7_g' po/Makefile
  sed -i 's_python _python2 _' po/Makefile
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' opendict.py
 
  make DESTDIR=$startdir/pkg/usr install || return 1
  ln -sf $startdir/pkg/usr/share/opendict/opendict.py $startdir/pkg/usr/bin/opendict
}
