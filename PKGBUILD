# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=maya-calendar-bzr
pkgver=r907
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('i686' 'x86_64')
url='https://launchpad.net/maya'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'contractor-bzr'
         'evolution-data-server' 'folks' 'gdk-pixbuf2' 'geocode-glib' 'glib2'
         'glibc' 'gtk3' 'libchamplain' 'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'granite-bzr' 'intltool' 'vala')
source=('maya-calendar::bzr+lp:maya')
sha256sums=('SKIP')

pkgver() {
  cd maya-calendar

  echo "r$(bzr revno)"
}

prepare() {
  cd maya-calendar

  sed 's|${CMAKE_INSTALL_FULL_LIBDIR}|${CMAKE_INSTALL_PREFIX}/lib|g' -i $(grep -rl CMAKE_INSTALL_FULL_LIBDIR)
}

build() {
  cd maya-calendar

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd maya-calendar/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
