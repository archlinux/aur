# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hypridle"
pkgver=0.1.1
pkgrel=1
pkgdesc="Hyprland's idle daemon"
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'sdbus-cpp')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'systemd' 'wayland-protocols' 'xorgproto')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=("hypridle")
conflicts=("hypridle-git")
sha256sums=('55dffb5b4cd25f034c6fdd98a9fa1d6763ff6e07b1d51b9e0b4cdd4fe65bc798')

build() {
	cd "$_archive"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
	cmake --build ./build --config Release --target hypridle
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

