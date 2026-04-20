# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.31
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2: to access Tail drives')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('d32e50ee031ee6c02c6e57fbf2b99435b7d07d88c55f7cfd64705109ea9df8bfb3dd147ebc4524fca80fe3c46e7da58799df746c9a3b6cedfccee4e62fb09e08')
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
