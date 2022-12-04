# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar-git
pkgver=6.1.2.r0.g7ade6132
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
  libhandy-1.so
)
makedepends=(
  git
  granite-git
  intltool
  meson
  vala
  libhandy
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
