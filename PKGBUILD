# Maintainer: Balthild <ibalthild@gmail.com>

_pkgname=gtklash
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc='A proxy client that supports multiple protocol'
arch=(x86_64)
url='https://github.com/balthild/GTKlash'
license=(GPL3)
depends=(
  glib2
  gtk3
  libgee
  libsoup
  librsvg
  json-glib
  gtksourceview4
  gnome-icon-theme-symbolic
)
makedepends=(
  git
  meson
  vala
  go
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname::git+https://github.com/balthild/gtklash.git)
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson -D b_pie=false $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
