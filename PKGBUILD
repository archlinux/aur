# $Id: PKGBUILD 198396 2016-12-07 19:39:04Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: javonera <javonera@gmail.com>

pkgname=screenlets
pkgver=0.1.6
pkgrel=6
pkgdesc="Widget framework that consists of small owner-drawn applications"
arch=('any')
url="https://launchpad.net/screenlets"
license=('GPL3')
depends=('python2-beautifulsoup3' 'python2-dbus' 'python2-gconf' 
         'python2-gnomekeyring' 'python2-rsvg' 'pywebkitgtk' 
         'python2-wnck' 'python2-xdg')
optdepends=('screenlets-pack-basic: Desktop widgets')
source=(https://launchpad.net/screenlets/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2{,.asc})
validpgpkeys=('D82D1D02396B27DC5045E356A01AFB1B15E8CCA4') # Guido Tabbernuk
md5sums=('028ce6b6c8764190d435436d5cbaf68c'
         'SKIP')

prepare() {
  cd $pkgname-$pkgver

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/share/screenlets-manager/*.py
  sed -i 's/python -u/python2 -u/' src/bin/* src/lib/*.py src/share/screenlets-manager/*.py
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
