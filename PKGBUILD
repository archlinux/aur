# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-music-git
pkgver=8.0.0.r16.g24912715
pkgrel=1
pkgdesc='The Pantheon Music Player'
arch=(x86_64)
url=https://github.com/elementary/music
license=(GPL-3.0-or-later)
groups=(pantheon-unstable)
depends=(
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  libadwaita
  libgranite-7.so
)
makedepends=(
  appstream
  git
  gobject-introspection
  granite7
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
sha256sums=('SKIP')

pkgver() {
  cd pantheon-music

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-music build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
