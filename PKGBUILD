# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.30
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2: to access Tail drives')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('4f8da56f2df85976b6929919db09e005b2471010f8421c371077dfb5c3e431d47f92cbeab9d4a90dca70678cdccf2d82f99b7f364511064793d0e4c194c0822e')
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
