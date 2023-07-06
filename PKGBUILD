# Maintainer: Luna Jernberg <lunajernberg@gnome.org>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-clocks-git
pkgver=44.0.r31.g6028a42
pkgrel=2
pkgdesc="Clocks applications for GNOME"
url="https://wiki.gnome.org/Apps/Clocks"
arch=(x86_64)
license=(GPL)
depends=(gtk3 libcanberra libgweather-4 gnome-desktop geoclue2 geocode-glib gsound)
makedepends=(vala gobject-introspection yelp-tools git meson)
groups=(gnome)
provides=(gnome-clocks)
conflicts=(gnome-clocks)
source=("git+https://gitlab.gnome.org/GNOME/gnome-clocks.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-clocks
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-clocks build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
