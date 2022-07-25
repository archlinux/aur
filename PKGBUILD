# Maintainer: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgname=geary-preview
pkgver=40.5
pkgrel=1
epoch=1
pkgdesc='A lightweight email client for the GNOME desktop. Preview version by Geary maintainer'
arch=(x86_64)
url=https://wiki.gnome.org/Apps/Geary
license=(GPL3)
groups=(gnome-extra)
provides=(geary)
conflicts=(geary)
depends=(
  cairo
  enchant
  folks
  gcr
  gdk-pixbuf2
  glib2
  gmime3
  gnome-online-accounts
  gsound
  gspell
  gtk3
  iso-codes
  libcanberra
  libgee
  libhandy
  libnotify
  libpeas
  libsecret
  libsoup
  libstemmer
  libxml2
  libytnef
  org.freedesktop.secrets
  pango
  sqlite
  webkit2gtk
)
makedepends=(
  appstream-glib
  cmake
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
source=(git+https://gitlab.gnome.org/GNOME/geary.git)
sha256sums=(SKIP)

prepare() {
  cd geary
  git checkout gnumdk/stable
}

build() {
  arch-meson geary build \
    -Dprofile=release \
    -Dvaladoc=disabled
  meson compile -C build
}

package() {
  meson install -C build \
    --destdir "${pkgdir}"
}

# vim: ts=2 sw=2 et:

