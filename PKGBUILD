# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana-bzr
pkgver=r12
pkgrel=1
pkgdesc='Ayatana indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-ayatana'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'libindicator-gtk3'
         'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-ayatana')
conflicts=('wingpanel-indicator-ayatana')
source=('bzr+lp:wingpanel-indicator-ayatana')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-ayatana

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-ayatana

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-ayatana/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-ayatana/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
