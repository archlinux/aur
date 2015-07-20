# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxtask-gtk3
_pkgname=lxtask
pkgver=0.1.6
pkgrel=1
pkgdesc='Task manager of the LXDE Desktop (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Add-icon-to-the-about-dialog.patch)
md5sums=('14b5341822aaa049f2d4d5a56c1b28f2' SKIP)

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
