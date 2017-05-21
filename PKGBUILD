# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot

_pkgname=libinput

pkgname=libinput-nosystemd
pkgver=1.7.0
pkgrel=1
pkgdesc="Input device management and event handling library"
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('mtdev' 'dbus-elogind' 'libevdev' 'libwacom-nosystemd' 'libusb-nosystemd')
# currently no doc files to install
makedepends=('doxygen' 'graphviz' 'gtk3')
provides=("libinput=${pkgver}" "$_pkgname")
conflicts=("$_pkgname")
#checkdepends=('check' 'libunwind')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz) #{,.sig})
sha256sums=('12a670f63d01e9e9c98ad0b31aef22160aac52187b4ee8f068a6902181c1a8a8')
# validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $_pkgname-$pkgver
# disabled for now:
# https://github.com/libcheck/check/issues/18
#  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  # install doc - no Makefile target
  install -v -dm755 ${pkgdir}/usr/share/doc/libinput
  cp -rv doc/html/* ${pkgdir}/usr/share/doc/libinput
}
