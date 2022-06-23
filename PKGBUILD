# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=libpanel-git
pkgver=r424.80823f0
pkgrel=1
epoch=0
pkgdesc='A dock/panel library for GTK 4'
arch=('x86_64')
url='https://gitlab.gnome.org/chergert/libpanel'
license=('GPL3')
provides=(libpanel)
depends=(
'gtk4>=4.3.0'
gobject-introspection
libadwaita
)
makedepends=(
meson
ninja
)
source=("git+https://gitlab.gnome.org/chergert/libpanel.git")
md5sums=('SKIP')

pkgver() {
  cd libpanel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libpanel
}

build() {
  arch-meson libpanel build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
