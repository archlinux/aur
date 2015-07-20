# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxrandr-gtk3
_pkgname=lxrandr
pkgver=0.3.0
pkgrel=1
pkgdesc="Monitor configuration tool (part of LXDE, GTK+ 3 version)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde-gtk3')
depends=('gtk3' 'xorg-xrandr')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Add-icon-to-the-about-dialog.patch)
md5sums=('250f0ebb09c1e02f430f951911ba1259'
         '0a3201017f165f2c15a611214eea1fa2')

prepare() {
  cd $_pkgname-$pkgver

  # Add icon to the about dialog
  patch -Np1 -i ../0001-Add-icon-to-the-about-dialog.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
