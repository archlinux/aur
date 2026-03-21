# Maintainer:
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname="gnome-contacts"
pkgname="$_pkgname-git"
pkgver=50.0.r0.gb1d8c42
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-contacts"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  dconf
  evolution-data-server
  folks
  gdk-pixbuf2
  glib2
  glycin
  glycin-gtk4
  gnome-online-accounts
  gst-plugin-gtk4
  gst-plugin-pipewire
  gst-plugins-base
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  libgoa
  libportal
  libportal-gtk4
  pango
  qrencode
)
makedepends=(
  appstream
  blueprint-compiler
  git
  gobject-introspection
  meson
  vala
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
