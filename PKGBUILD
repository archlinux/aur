# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=fusion-icon
epoch=1
pkgver=0.1
pkgrel=6
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
provides=('fusion-icon=0.1')
conflicts=('fusion-icon0.9')
depends=('pygtk' 'compizconfig-python' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')
install=$pkgname.install
source=("http://archlinux.c3sl.ufpr.br/other/community/$pkgname/$pkgname-$pkgver.tar.gz" 
        "fix_glib_crash.patch")
sha256sums=('da23acad5bc6d2d062744faafdfe5f71d5f8a787bd464642d763fb1559253c3d'
            'a93dadb6e78cc5e5281ec60a06b62e3d2a07b1c5683abaefb633a5fa35a25881')

prepare() {
  cd $srcdir/$pkgname

  # python2 fix
  sed -i 's_@python_@python2_' Makefile
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  # apply patches
  patch -p1 -i $srcdir/fix_glib_crash.patch
}

package() {
  cd $srcdir/$pkgname
  make PREFIX=/usr DESTDIR=$pkgdir install
}
