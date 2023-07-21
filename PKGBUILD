# Maintainer:  Dimitris Kiziridis <dkiziridis at outlook dot com>

pkgname=pqmarble-git
pkgver=r39.f240b2e
pkgrel=1
pkgdesc="Utility library for GNOME apps"
arch=(x86_64)
url="https://gitlab.gnome.org/raggesilver/marble"
license=(GPL3)
depends=(gtk4)
makedepends=(git meson vala gobject-introspection)
checkdepends=(appstream-glib)
source=("${pkgname}::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname}"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname}"
  arch-meson build
  meson compile -C build
}

check() {
  cd "${pkgname}"
  meson test -C build
}

package() {
  cd "${pkgname}"
  meson install -C build --destdir "$pkgdir"
}
