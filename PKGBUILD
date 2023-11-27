# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-gui-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Festival music player GUI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/gui-v${pkgver}/Festival-v${pkgver}-linux-x64.tar.gz")
sha256sums=('69728d0146c8d9c02a9241c062d37d2354d9d2606fe323ee722f11d9d968a0a0')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')
depends=('dbus' 'glibc' 'gtk3' 'gcc-libs' 'libpulse')

package() {
	cd "$srcdir"

	# Binary
	install -Dm755 festival "${pkgdir}/usr/bin/festival"

	# Icon
	install -Dm644 festival.png "${pkgdir}/usr/share/pixmaps/festival.png"

	# FIXME:
	# This is a workaround to lowercase
	# the binary in the `.desktop` file.
	sed -i 's/Exec=Festival/Exec=festival/' festival.desktop

	# `.desktop` file.
	install -Dm644 festival.desktop "${pkgdir}/usr/share/applications/festival.desktop"
}
