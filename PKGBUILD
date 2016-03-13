# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=light-locker-consolekit
_pkgname=light-locker
pkgver=1.7.0
pkgrel=1
pkgdesc='A simple session locker, with consolekit support'
arch=('i686' 'x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk3' 'libxxf86misc' 'lightdm' 'libxss' 'consolekit')
makedepends=('gnome-common' 'intltool')
conflicts=('light-locker' 'light-locker-upower')
provides=('light-locker')
install='light-locker.install'
source=("https://github.com/the-cavalry/light-locker/releases/download/v${pkgver}/light-locker-${pkgver}.tar.bz2")
sha256sums=('938baae14576e91b1fa0af963941bae6ef8d141bd83b513ff02256d8b6e79e29')

build () {
  cd light-locker-${pkgver}

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --with-x \
    --with-dpms-ext \
    --with-mit-ext \
    --with-xf86gamma-ext \
    --without-systemd \
    --with-console-kit \
    --without-upower \
    --disable-schemas-compile \
    --disable-static
  make
}

package() {
  cd light-locker-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
