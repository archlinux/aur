# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libpqmarble
pkgver=1.3.0+12+gf240b2e
pkgrel=1
pkgdesc="Utility library for GNOME apps."
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/marble"
license=('GPL3')
depends=('gtk4')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=('libpqmarble.so=2')
conflicts=('libmarble')
replaces=('libmarble')
_commit=f240b2ec7d5cdacb8fdcc553703420dc5101ffdb
source=("git+https://gitlab.gnome.org/raggesilver/marble.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/marble"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  arch-meson marble build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
