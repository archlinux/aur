# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana
pkgver=2.0.3
pkgrel=1
pkgdesc='Wingpanel Ayatana Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-ayatana'
license=('GPL3')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libindicator-gtk3-ubuntu'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'gobject-introspection' 'vala')
source=("wingpnel-indicator-ayatana-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-ayatana/archive/${pkgver}.tar.gz")
sha256sums=('5f6cd50a63784ae5f48efd954707274d6d299af87ce8e476cd00db459ba48071')

prepare() {
  cd wingpanel-indicator-ayatana-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-ayatana-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-ayatana-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
