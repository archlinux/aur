# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=obs-wayland-hotkeys
pkgver=1.1.1
pkgrel=1
pkgdesc="OBS Studio plugin that implements the global shortcuts portal"
arch=('x86_64')
url="https://github.com/leia-uwu/obs-wayland-hotkeys"
license=('GPL-2.0-or-later')
depends=('obs-studio' 'glibc' 'libstdc++' 'qt6-base' 'libgcc')
makedepends=('cmake' 'ninja' 'wayland' 'libxkbcommon')
optdepends=()
install=
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb9a40fd7c80c55f83d157ae1c4aa6dc2a328f77079581c4d4b6d6d1aa8087ec')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir"
	cmake -B build -S "${pkgname}-${pkgver}" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
}
