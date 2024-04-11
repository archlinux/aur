# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=gtk-session-lock-git
_pkgname=gtk-session-lock
pkgver=0.2.0.r0.gb3544f3
pkgrel=1
provides=(gtk-session-lock libgtk-session-lock.so=0-64)
conflicts=(gtk-session-lock)
pkgdesc="A library to create screen lockers for Wayland using the ext-session-lock protocol"
arch=(x86_64)
license=(GPL3)
url="https://github.com/Cu3PO42/gtk-session-lock"
depends=(
  gtk3
  wayland
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
  wayland-protocols
)
source=("git+https://github.com/Cu3PO42/gtk-session-lock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

