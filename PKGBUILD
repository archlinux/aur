# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar-git
pkgver=r1772.dcb72b85
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('x86_64')
url='https://github.com/elementary/calendar'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'evolution-data-server' 'folks'
         'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc' 'gtk3' 'libchamplain'
         'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala')
provides=('pantheon-calendar')
conflicts=('pantheon-calendar')
source=('pantheon-calendar::git+https://github.com/elementary/calendar.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calendar

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-calendar build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
