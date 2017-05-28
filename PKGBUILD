# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana-git
pkgver=r36.8533b03
pkgrel=1
pkgdesc='Wingpanel Ayatana-Compatibility Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-ayatana'
license=('GPL3')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libindicator-gtk3-ubuntu'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'vala')
provides=('wingpanel-indicator-ayatana')
conflicts=('wingpanel-indicator-ayatana')
replaces=('wingpanel-indicator-ayatana-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-ayatana.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-ayatana

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
