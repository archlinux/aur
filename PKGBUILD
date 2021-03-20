# $Id: PKGBUILD 109028 2014-04-09 12:12:14Z alucryd $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=light-locker-gtk2
_pkgname=light-locker
pkgver=1.8.0
pkgrel=1
pkgdesc='A simple session locker'
arch=('i686' 'x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk2' 'libxxf86misc' 'lightdm' 'libxss' 'dconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('gnome-common' 'intltool')
source=("https://github.com/the-cavalry/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('3c76106f40a8efe67b462061e4c798e3e501b54356c8cdc1b67a3022d9d7dba1')

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
