# Maintainer: Chen Ark <ark2241@outlook.com>
pkgname=sfd-tool
pkgver=1.8.9.1
pkgrel=1891
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

makedepends=(
	'cmake'
	'gettext'
	'imagemagick'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('d90278651cbc9c63a081c1d9f149d72c55d8f7baf4cb94c53d9b754fe4433e03')

_srcname=sfd_tool

build() {
    cmake -B build -S "$srcdir/$_srcname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
