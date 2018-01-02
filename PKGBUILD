# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar
pkgver=0.4.1
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('x86_64')
url='https://launchpad.net/maya'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'clutter' 'clutter-gtk' 'contractor' 'evolution-data-server'
         'folks' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc' 'gtk3'
         'libchamplain' 'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('cmake' 'intltool' 'vala')
conflicts=('maya-calendar')
provides=('maya-calendar')
replaces=('maya-calendar')
source=("pantheon-calendar-${pkgver}.tar.gz::https://github.com/elementary/calendar/archive/${pkgver}.tar.gz")
sha256sums=('3f9b2207ee59083ad09d0a409b81b9f4e8fb5b40aa7342c333c05e1edd04cdd3')

prepare() {
  #sed 's|${CMAKE_INSTALL_FULL_LIBDIR}|${CMAKE_INSTALL_PREFIX}/lib|g' -i $(grep -rl CMAKE_INSTALL_FULL_LIBDIR)

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../calendar-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
