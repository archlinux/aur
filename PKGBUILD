# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=light-locker-consolekit
_pkgname=light-locker
pkgver=1.6.0
pkgrel=1.2
pkgdesc='A simple session locker, with upower and consolekit support'
arch=('i686' 'x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk3' 'libxxf86misc' 'lightdm' 'libxss' 'upower=0.9.23' 'consolekit')
makedepends=('gnome-common' 'intltool')
#replaces=('light-locker-upower')
conflicts=('light-locker' 'light-locker-upower')
provides=('light-locker')
install='light-locker.install'
source=("https://github.com/the-cavalry/light-locker/releases/download/v${pkgver}/light-locker-${pkgver}.tar.bz2")
sha256sums=('63e0cbcc7ceb8ad695b4bbe7eb9ba5fee32f47790ccde048748d8a47edd32ad0')

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
    --with-upower \
    --disable-schemas-compile \
    --disable-static
  make
}

package() {
  cd light-locker-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
