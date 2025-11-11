# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.27
pkgrel=2
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('57a31e81da8f1c9a52d50255e38cfaf051bafec3f20c9aab4b87987f4f5fbb1c593687bc6dc415d6c41bbf19154e0ee1e0322c714bb08d7f3ca26988d5b53817')
options=('strip')

build() {
	local cmake_options=(
		-B build
		-S $pkgname
		-W no-dev
		-D CMAKE_BUILD_TYPE=Release
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
