# Maintainer: éclairevoyant
# Contributor: Grey Christoforo <first name at last name dot net>

_pkgname=drafting
pkgname="$_pkgname-git"
pkgver=r857.0c81b82
pkgrel=1
epoch=0
pkgdesc='UI designer for GTK 4 that can be used standalone or integrated with GTK 4-based IDEs'
arch=('x86_64')
url='https://gitlab.gnome.org/chergert/drafting'
license=('GPL3')
depends=(
'gtk4>=4.3.0'
gobject-introspection
libpanel
libadwaita
)
makedepends=(
git
itstool
meson
ninja
)
source=("git+https://gitlab.gnome.org/chergert/drafting.git")
md5sums=('SKIP')

pkgver() {
  cd drafting
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd drafting
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
