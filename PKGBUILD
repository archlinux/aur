# $Id: PKGBUILD 109028 2014-04-09 12:12:14Z alucryd $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=light-locker-gtk2
_pkgname=light-locker
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple session locker'
arch=('i686' 'x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk2' 'libxxf86misc' 'lightdm' 'libxss')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('gnome-common' 'intltool')
source=("https://github.com/the-cavalry/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('560f20390b24513d5bf7b691bac5d745b76eb21ac3bccd877b73cb7f6d137ec3')

build () {
  cd ${_pkgname}-${pkgver}

  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --disable-{schemas-compile,static} --with-{gtk2,mit-ext,systemd,xf86gamma-ext,x} --without-{console-kit,upower}
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
