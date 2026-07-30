pkgname=xdg-desktop-portal-hypr-remote-git
pkgver=r4.f463018
pkgrel=1
url="https://github.com/gac3k/${pkgname%-git}"
pkgdesc='a complete implementation of the RemoteDesktop portal for Hyprland'
arch=(x86_64)
license=(MIT)
depends=(libei
         xdg-desktop-portal)
makedepends=(cmake
             git
             hyprland-protocols
             sdbus-cpp
             systemd
             wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

prepare() {
	mkdir -p build
}

build() {
	cmake -B build -S "${pkgname%-git}" -W no-author
	cmake --build build
}

package() {
	DESTDIR="$pkgname" cmake --install build
}
