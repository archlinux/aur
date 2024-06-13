# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprutils"
pkgver=0.1.2
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(any)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=()
makedepends=('git' 'cmake' 'gcc' 'make')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=('hyprutils')
sha256sums=('a11598fbba1dcb8e1f939935ed55339b481816b1fddc89dbbfe4dafb4d753562')

build() {
	cd "$_archive"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
