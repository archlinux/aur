# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound-bzr
pkgver=r36
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee'
         'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'gtk2' 'vala')
provides=('wingpanel-indicator-sound')
conflicts=('wingpanel-indicator-sound')
install='wingpanel-indicator-sound.install'
source=('bzr+lp:wingpanel-indicator-sound')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-sound

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-sound

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-sound/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-sound/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
