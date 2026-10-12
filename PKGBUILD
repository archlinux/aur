# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.36
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'tailscale' 'qt6-base' 'hicolor-icon-theme' 'knotifications')
optdepends=('davfs2: to access Tail drives')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('e8c69b0adc7f4b829beebb388a588d17b1b6dbf714277769263282544c564fbb2784669ae65cc823c772ee9f96e6bee3d8ae63dd5797e5b8e1984087c72e4f2b')
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
