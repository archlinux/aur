# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-notifications
pkgver=2.0
pkgrel=1
pkgdesc='Notifications indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-notifications'
license=('GPL3')
groups=('pantheon')
depends=('dbus-glib' 'glib2' 'glibc' 'gtk3' 'libdbus' 'libwnck3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/wingpanel-indicator-notifications/loki/${pkgver}/+download/wingpanel-indicator-notifications-${pkgver}.tar.xz")
sha256sums=('bc6271573df2c563bd6d077a8aba5fc7574f5efcc3b4da235d86646cea1a6d55')

prepare() {
  cd wingpanel-indicator-notifications-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-notifications-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-notifications-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
