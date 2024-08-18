# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar-git
pkgver=8.0.0.r1.gf2938b8c
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=(x86_64)
url=https://github.com/elementary/calendar
license=(GPL-3.0-or-later)
groups=(pantheon-unstable)
depends=(
  clutter
  clutter-gtk
  evolution-data-server
  folks
  gdk-pixbuf2
  geoclue
  glib2
  gtk3
  libchamplain
  libgee
  libgranite.so
  libical
  libhandy-1.so
  libportal-gtk3
)
makedepends=(
  git
  granite
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
