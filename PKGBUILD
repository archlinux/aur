# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-stable-fix
pkgver=40.0
pkgrel=1
epoch=1
pkgdesc='A lightweight email client for the GNOME desktop; fix FS#70566, FS#70577 '
arch=(x86_64)
provides=('geary')
replaces=('geary')
conflicts=('geary')
url=https://wiki.gnome.org/Apps/Geary
license=(GPL3)
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
  libstemmer # FS#70577
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
_commit=e561775c1580a9f60a726355b2b897bfc9cb3382  # tags/gnome-40.0^0
source=("git+https://gitlab.gnome.org/GNOME/geary.git#commit=$_commit")
validpgpkeys=(3A2EF7F138557A145F2866E99FAB18747A8FC649) # Michael James Gratton <mike@vee.net>
sha256sums=(SKIP)

pkgver() {
  cd geary
  git describe --tags | sed 's/^gnome-//g; s/-/+/g'
}

build() {
  arch-meson geary build -Dprofile=release # FS#70566
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
