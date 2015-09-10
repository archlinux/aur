# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth-bzr
pkgver=r5
pkgrel=1
pkgdesc='Bluetooth indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-bluetooth')
conflicts=('wingpanel-indicator-bluetooth')
source=('bzr+lp:wingpanel-indicator-bluetooth')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-bluetooth

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-bluetooth

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-bluetooth/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-bluetooth/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
