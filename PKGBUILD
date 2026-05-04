# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.32
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2: to access Tail drives')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('8b76bf7ce619907163a5ebba3877d22cf550cd4239070dfb84a6d4f96dd9aba2ce89a04f6bd0f288c3d651f144e8e83decdfa3702d02e7a606930ab31b0c5389')
options=('strip')

build() {
	local cmake_options=(
		-B build
		-S $pkgname
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=/lib
		-D KNOTIFICATIONS_ENABLED=ON
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
