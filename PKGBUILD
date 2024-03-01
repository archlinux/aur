# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprlock"
pkgver=0.1.0
pkgrel=2
pkgdesc=" Hyprland's GPU-accelerated screen locking utility "
arch=(any)
url="https://github.com/hyprwm/hyprlock"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'cairo' 'pango' 'pam' 'libxkbcommon' 'libglvnd' 'libdrm' 'mesa')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'wayland-protocols' 'xorgproto')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(hyprlock)
conflicts=(hyprlock-git)
sha256sums=('5d0e6547ac073c78e95d4f086a258e1e5713168827c38ccb2466f2c4d96bd1df')

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

