# $Id: PKGBUILD,v 1.5 2009/07/12 18:22:32 cprimier Exp $
# Maintainer: jhbruhn <aur@jhbruhn.de> 
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

_pkgname=avr-libc
pkgname=$_pkgname-16
pkgver=1.6.7
pkgrel=1
pkgdesc="The C runtime library for the AVR family of microcontrollers"
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/avr-libc/"
license=('BSD')
depends=('avr-gcc')
options=(!strip)
source=(http://savannah.nongnu.org/download/avr-libc/old-releases/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('1ccf8078e583d527392f079082f816b0')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make || return 1
}
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE \
      ${pkgdir}/usr/share/licenses/${_pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
