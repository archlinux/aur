# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar-git
pkgver=5.1.1.r65.gdf9d6899
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=(x86_64)
url=https://github.com/elementary/calendar
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  cairo
  clutter
  clutter-gtk
  evolution-data-server
  folks
  gdk-pixbuf2
  geoclue
  geocode-glib
  glib2
  gtk3
  libchamplain
  libgee
  libgranite.so
  libical
  libnotify
  libsoup
)
makedepends=(
  git
  granite
  intltool
  meson
  vala
)
provides=(pantheon-calendar)
conflicts=(pantheon-calendar)
source=(pantheon-calendar::git+https://github.com/elementary/calendar.git)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-calendar

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-calendar build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
