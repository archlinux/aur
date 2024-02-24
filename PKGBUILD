# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hypridle"
pkgver=0.1.0
pkgrel=0
pkgdesc="Hyprland's idle daemon"
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'sdbus-cpp')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'systemd' 'wayland-protocols' 'xorgproto')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
conflicts=("${pkgname}-git")
provides=(hypridle)
sha256sums=('SKIP')

build() {
	cd "$_archive"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
	cmake --build ./build --config Release --target hypridle
}

package() {
	cd "$_archive"
	install -Dm755 build/hypridle -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
