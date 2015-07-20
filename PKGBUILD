# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxterminal-gtk3
_pkgname=lxterminal
pkgver=0.2.0
pkgrel=1
pkgdesc="VTE-based terminal emulator (part of LXDE, GTK+ 3 version)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde-gtk3')
depends=('vte3')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
install=$_pkgname.install
source=(http://downloads.sourceforge.net/lxde/${_pkgname}-${pkgver}.tar.gz
        0001-Port-to-vte-2.91-API.patch)
md5sums=('e80ad1b6e26212f3d43908c2ad87ba4d'
         '5ccc27d1d91bdef8c37aa7a44310c1de')

prepare() {
  cd $_pkgname-$pkgver

  # Port to vte-2.91 API
  patch -Np1 -i ../0001-Port-to-vte-2.91-API.patch

  autoreconf -fi
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
