# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=maya-calendar
pkgver=0.4.0.2
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
sha256sums=('853164e291e9cf4e705c413a7dae13c810a248d9d3ee263fbf56d785e941170b')

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
