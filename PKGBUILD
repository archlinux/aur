# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=gtk-session-lock-git
_pkgname=gtk-session-lock
pkgver=r510.00599bf
pkgrel=1
provides=(gtk-session-lock)
pkgdesc="A library to create screen lockers for Wayland using the ext-session-lock protocol"
arch=(x86_64)
url="https://github.com/Cu3PO42/gtk-session-lock"
depends=(gtk3)
makedepends=(meson wayland git gobject-introspection valabind)
source=("git+https://github.com/Cu3PO42/gtk-session-lock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "$pkgdir"
}

