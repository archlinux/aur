# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxrandr-gtk3
_pkgname=lxrandr
pkgver=0.3.0
pkgrel=3
pkgdesc="Monitor configuration tool (part of LXDE, GTK+ 3 version)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde-gtk3')
depends=('gtk3' 'xorg-xrandr')
makedepends=('intltool')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Add-icon-to-the-about-dialog.patch
        0002-Use-video-display-as-icon.patch)
md5sums=('250f0ebb09c1e02f430f951911ba1259'
         '0294766a9f89ce9f24e22ab6666d1dd1'
         'a87e6236b7d36ca9967ca1eada3abf7f')

prepare() {
  cd $_pkgname-$pkgver

  # Add icon to the about dialog
  patch -Np1 -i ../0001-Add-icon-to-the-about-dialog.patch
  patch -Np1 -i ../0002-Use-video-display-as-icon.patch
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
