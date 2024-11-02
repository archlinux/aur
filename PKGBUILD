# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Forked from extra/libdbusmenu-qt. Original contributors:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=libdbusmenu-lxqt
pkgname=libdbusmenu-lxqt-git
pkgver=0.1.0.r13.g50dc8f5
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64)
url='https://github.com/lxqt/libdbusmenu-lxqt'
# https://github.com/lxqt/libdbusmenu-lxqt/blob/master/COPYING
# All source files contain "any later"
license=(LGPL-2.0-or-later)
depends=(qt6-base)
makedepends=(cmake doxygen git)
checkdepends=(dbus xorg-server-xvfb)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/libdbusmenu-lxqt")
sha256sums=('SKIP')

pkgver() {
  cd libdbusmenu-lxqt
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  cmake -B build -S libdbusmenu-lxqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  dbus-launch xvfb-run --auto-display cmake --build build --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
