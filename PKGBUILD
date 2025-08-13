# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcm-git
pkgver=0.9.0.r7.gb5b5aef
pkgrel=1
pkgdesc='Wayfire Config Manager'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(gtkmm3 wayfire-git wf-shell-git)
makedepends=(wayland-protocols meson ninja git extra-cmake-modules)
optdepends=("wayfire-plugins-extra: configuration for extra Wayfire plugins"
            "wdisplays: configuration for display modes")
source=("${pkgname}::git+https://github.com/WayfireWM/wcm")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

prepare() {
  rm -rf build
  arch-meson "${pkgname}" build
}

build () {
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
