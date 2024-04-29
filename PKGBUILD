# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprwayland-scanner"
pkgver=0.3.2
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++"
arch=(any)
url="https://github.com/hyprwm/hyprwayland-scanner"
license=('BSD-3-Clause')
depends=('pugixml')
makedepends=('git' 'cmake' 'gcc')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(hyprwayland-scaner)
sha256sums=('e875dcd7615a28484298945fa9e441a62725e1abcb825740bb42fc4e170ef964')

build() {
	cd "$_archive"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
	cmake --build ./build --config Release
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

