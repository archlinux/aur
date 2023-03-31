# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=wayland-utils
pkgname=wayland-utils-git
pkgver=1.1.0.r11.g1469c7e
pkgrel=1
pkgdesc="Wayland tools to display information about current compositor"
url="https://gitlab.freedesktop.org/wayland/wayland-utils"
arch=(x86_64)
license=(MIT)
depends=(wayland libdrm)
makedepends=(meson wayland-protocols git)
conflicts=(wayland-utils)
provides=(wayland-utils)
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')


pkgver() {
  cd "${_pkgname}" 
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/wayland.utils.//'
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 "${_pkgname}"/COPYING -t "$pkgdir"/usr/share/licenses/"${_pkgname}"
}
