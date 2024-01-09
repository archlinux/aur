# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-gui-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Festival music player GUI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/gui-v${pkgver}/Festival-v${pkgver}-linux-x64.tar.gz")
sha256sums=('be4d53da12968ac36b2938a29deb5ef70ceec397c5133389ce02c41f9824ac0b')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')
depends=('libpulse' 'gtk3')

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
