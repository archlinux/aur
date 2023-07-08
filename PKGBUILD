# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Forked from extra/libdbusmenu-qt. Original contributors:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libdbusmenu-lxqt-git
pkgver=0.0.0.r354.7cc060c
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64)
url='https://github.com/lxqt/libdbusmenu-lxqt'
license=(GPL)
depends=(qt6-base)
makedepends=(cmake doxygen git)
checkdepends=(dbus xorg-server-xvfb)
source=("git+https://github.com/lxqt/libdbusmenu-lxqt")
sha256sums=('SKIP')

pkgver() {
  cd libdbusmenu-lxqt
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
