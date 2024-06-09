# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprutils"
pkgver=0.1.1
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(any)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=()
makedepends=('git' 'cmake' 'gcc')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=('hyprutils')
sha256sums=('a9d799b12338e911e6c1ff776ebeabbf71ce5032a56d074ce7f2226267e10b29')

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
