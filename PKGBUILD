# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libspelling-git
_pkgname=libspelling
provides=(libspelling)
conflicts=(libspelling)
pkgver=r29.8a8b31b
pkgrel=1
pkgdesc="Spellcheck library for GTK4"
url="https://gitlab.gnome.org/chergert/libspelling/"
arch=(x86_64)
license=(LGPL)
depends=(
gtk4
enchant
gtksourceview5
)
makedepends=(
  autoconf-archive
  git
  gtk-doc
  gobject-introspection
  gi-docgen
  vala
)
_commit=HEAD
source=("git+https://gitlab.gnome.org/chergert/libspelling.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build
  meson setup --prefix=/usr --buildtype=plain "$_pkgname" build -Ddocs=false
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
