# Maintainer: Chen Ark <ark2241@outlook.com>
pkgname=sfd-tool
pkgver=1.8.9.2
pkgrel=1893
pkgdesc="SFD Tool is a cross‑platform GUI and CLI tool for working with Spreadtrum/UNISOC devices. It focuses on safe partition backup/restore, PAC flashing, and advanced maintenance operations, with first‑class support for modern 64‑bit platforms."
arch=('x86_64')
url="https://github.com/C-Hidery/sfd_tool"
license=('GPL-3.0-or-later')
options=(!debug)
depends=(
	'hicolor-icon-theme'
	'gtk3'	
	'libusb'
)
install=sfd-tool.install
makedepends=(
	'cmake'
	'gettext'
	'imagemagick'
)

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"99-sprd.rules"
)

sha256sums=('c7bfe9681530312b8e99f7c88c0731e4d217a04bd05f9a824ce0740d560cc15d'
            '5b561bef25bd00650f7b4a236d291229623cdccf152bf6fdf8214aecc7d37e2e')

_srcname=sfd_tool

build() {
	cmake -B build -S "$srcdir/$_srcname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 99-sprd.rules \
		"$pkgdir/usr/lib/udev/rules.d/99-sprd.rules"
}
