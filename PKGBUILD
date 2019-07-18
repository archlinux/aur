# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-music-git
pkgver=r3871.62f2cce5
pkgrel=1
pkgdesc='The Pantheon Music Player'
arch=(x86_64)
url=https://github.com/elementary/music
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  gtk3
  json-glib
  libaccounts-glib
  libgda
  libgee
  libgpod
  libgranite.so
  libgsignon-glib
  libpeas
  libsignon-glib
  libsoup
  pango
  taglib
  zeitgeist
)
makedepends=(
  appstream
  git
  gobject-introspection
  granite-git
  intltool
  meson
  vala
)
optdepends=(
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'gst-libav: Libav plugin'
)
provides=(pantheon-music)
conflicts=(pantheon-music)
source=(pantheon-music::git+https://github.com/elementary/music.git)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-music

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-music build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
