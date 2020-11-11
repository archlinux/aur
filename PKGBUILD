# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcm-git
pkgver=0.6.0.r0.g5d935e0
pkgrel=1
pkgdesc='Wayfire Config Manager'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(gtkmm3 wayfire-git wf-shell-git)
makedepends=(wayland-protocols meson ninja git extra-cmake-modules)
optdepends=("wayfire-plugins-extra: configuration for extra Wayfire plugins")
source=("${pkgname}::git+https://github.com/WayfireWM/wcm")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

build () {
	rm -rf build
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}

