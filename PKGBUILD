# Maintainer: willemw <willemw12@gmail.com>

pkgname=mythtv-indicator-bzr
pkgver=r9
pkgrel=3
pkgdesc="MythTV panel indicator"
url="http://www.mythtv.org/wiki/MythTV-indicator"
license=('GPL3')
arch=('any')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'python2-dateutil' 'python2-gobject' 'python2-lxml' 'python2-pillow' 'python2-simplejson')
makedepends=('bzr' 'python-dulwich')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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

