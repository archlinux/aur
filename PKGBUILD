# Maintainer: Chen Ark <ark2241@outlook.com>
pkgname=sfd-tool
pkgver=1.8.9.4
pkgrel=1894
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
	"sfd-tool.install"
)

sha256sums=('746fe52adbcb82244f7d894b9c381c1390e484a0eece4237175d1d1798c061f2'
            '5b561bef25bd00650f7b4a236d291229623cdccf152bf6fdf8214aecc7d37e2e'
            'f6ee547089356a8fe175c82e80445df69c00629b754cb15a6ec020db8d9d5381')

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
