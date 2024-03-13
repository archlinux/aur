# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprlock"
pkgver=0.2.0
pkgrel=1
pkgdesc=" Hyprland's GPU-accelerated screen locking utility"
arch=(any)
url="https://github.com/hyprwm/hyprlock"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'cairo' 'pango' 'pam' 'libxkbcommon' 'libglvnd' 'libdrm' 'mesa')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'wayland-protocols' 'xorgproto')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(hyprlock)
conflicts=(hyprlock-git)
sha256sums=('3d56220ac03016163e196bc2c08e5b16e83583fa9446ad52e32ddbb56c293994')


backup=('etc/pam.d/hyprlock')

build() {
	cd "$_archive"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
	cmake --build ./build --config Release --target hyprlock
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

