# Maintainer: Sergii Fesenko <sergii_f@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=granite-git
_pkgname=granite
pkgver=6.0.0.r22.d55a14fa
pkgrel=1
pkgdesc='Library that extends GTK with common widgets and utilities'
arch=(x86_64)
url=https://github.com/elementary/granite
license=(LGPL3)
groups=(pantheon-unstable)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  gtk3
  libgee
  pango
)
makedepends=(
  git
  gobject-introspection
  meson
  ninja
  vala
)
provides=(
  granite
  libgranite.so
)
conflicts=(granite)
source=(git+https://github.com/elementary/granite.git)
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson ${_pkgname} build \
    -D b_pie='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
