# Maintainer: willemw <willemw12@gmail.com>

_pkgname=mythtv-indicator
pkgname=$_pkgname-bzr
pkgver=r9
pkgrel=2
pkgdesc="MythTV panel indicator"
url="http://www.mythtv.org/wiki/MythTV-indicator"
license=('GPL3')
arch=('any')
depends=('gtk3' 'python2-gobject' 'libappindicator-gtk3' 'libnotify'
         'python2-lxml' 'python2-simplejson' 'python2-dateutil' 'python2-pillow')
makedepends=('bzr')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::bzr+http://bazaar.launchpad.net/~r-d-vaughan/mythtv-indicator/trunk/)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname

  cd mythtv-indicator/usr/share/mythtv-indicator/
  sed -i "s|^#![ ]*/usr/bin/env[ ]*python[ ]*$|#!/usr/bin/env python2|" mythtv-indicator.py importcode/*.py
  sed -i "s|^#![ ]*/usr/bin/python[ ]*$|#!/usr/bin/python2|" mythtv-indicator.py importcode/*.py
  sed -i "s|^\(.*[ ]*=[ ]*u'\)python |\1python2 |" mythtv-indicator.py importcode/*.py
}

package() {
  cd $pkgname
  cp -a mythtv-indicator/* "$pkgdir"
}

