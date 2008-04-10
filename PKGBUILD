# $Id: PKGBUILD,v 1.2 2008/03/21 22:09:03 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.3.5
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk2>=2.12.9' 'avahi>=0.6.20' 'libsoup>=2.4.1')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.3/${pkgname}-${pkgver}.tar.bz2
	libepc-avahi-free-check.patch)
md5sums=('83c931954c7428e57b2bdf8f36ecb0d0' '31761c1165d9b0b61df38049165779ff')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/libepc-avahi-free-check.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
