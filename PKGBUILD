# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=maya-calendar
pkgver=0.4.0.1
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('i686' 'x86_64')
url='https://launchpad.net/maya'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'clutter' 'clutter-gtk' 'contractor' 'evolution-data-server'
         'folks' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc' 'gtk3'
         'libchamplain' 'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('cmake' 'intltool' 'vala')
source=("https://launchpad.net/maya/loki/${pkgver}/+download/maya-calendar-${pkgver}.tar.xz")
sha256sums=('2c7fd1cad97bfb86474ad35b77125946eb321b2a6b3049e4e62e0aae059fe569')

prepare() {
  cd maya-calendar-${pkgver}

  sed 's|${CMAKE_INSTALL_FULL_LIBDIR}|${CMAKE_INSTALL_PREFIX}/lib|g' -i $(grep -rl CMAKE_INSTALL_FULL_LIBDIR)

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd maya-calendar-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd maya-calendar-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
