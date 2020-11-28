# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=wayland-utils
pkgname=wayland-utils-git
pkgver=1.0.0.r1.g23d5d8b
pkgrel=1
pkgdesc="Wayland tools to display information about current compositor"
url="https://gitlab.freedesktop.org/wayland/wayland-utils"
arch=(x86_64)
license=(MIT)
depends=(wayland wayland-protocols)
makedepends=(meson git)
conflicts=(wayland-utils)
provides=(wayland-utils)
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${_pkgname}" 
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/wayland.utils.//'
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}