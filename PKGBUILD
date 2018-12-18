# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=granite-git
pkgver=5.2.2.r2.f1b29f52
pkgrel=1
pkgdesc='Library that extends Gtk+'
arch=(x86_64)
url='https://github.com/elementary/granite'
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
  cd granite

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson granite build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
