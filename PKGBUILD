# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprcursor"
pkgver=0.1.0
pkgrel=1
pkgdesc="The hyprland cursor format, library and utilities"
arch=(any)
url="https://github.com/hyprwm/hyprcursor"
license=('BSD')
depends=('hyprlang>=0.4.2' 'cairo' 'libzip' 'librsvg')
makedepends=('git' 'cmake' 'gcc' 'gdb')
_archive="${pkgname}-${pkgver}"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=("hyprcursor")
conflicts=("hyprcursor-git")
sha256sums=('b1f28898be5dc32f7511a530b9781f7617be6f5a7c226ff981cb325604017a6c')

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

