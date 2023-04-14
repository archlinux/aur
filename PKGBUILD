# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname="gnome-contacts"
pkgname="$_pkgname-git"
pkgver=44.0.r5.gdee5b4cc
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
# https://wiki.gnome.org/Apps/Contacts
url="https://gitlab.gnome.org/GNOME/gnome-contacts"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL2)
depends=(
  evolution-data-server
  folks
  gnome-online-accounts
  gtk4
  libadwaita
  libgee
  libportal-gtk4
  qrencode
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
  vala
)
groups=(gnome)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$srcdir/$_pkgname" build 
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
