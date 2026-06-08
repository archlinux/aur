# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=obs-wayland-hotkeys
pkgver=1.1.0
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
sha256sums=('3625853db78ab4a7b06fe9dfc2bf5abe9c0099c572d20f913e01e4878aa6981e')

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
