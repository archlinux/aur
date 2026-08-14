# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.34
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2: to access Tail drives')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('a18cd2bfb40e80f14ef42df5f1b2c5ffe77986b73f91c6dd50bea794d9b779370ca2cfd2c9c85f766b584b9212238cf03449bf1c69adb584a1d2243e1591f35b')
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
