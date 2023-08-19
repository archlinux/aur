# Maintainer: Genstar <genstar@disroot.org>
pkgname=openmsx-debugger-git
pkgver=INIT.r564.9766bd5
pkgrel=1
pkgdesc="Debugger for MSX emulator."
arch=(x86_64)
url="https://github.com/openMSX/debugger"
license=('GPL')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'python')
optdepends=('openmsx: emulator')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname%-git}"'::git+https://github.com/openMSX/debugger.git'
	'openmsx-debugger.desktop'
)
noextract=()
md5sums=(
	'SKIP'
	'19f9642c7b09efd041c9ae8fa7e54fb3'
)
sha256sums=(
	'SKIP'
	'eda56d641a609aad4da3aff710a0b1edcc968f22a45369912c6966b1df350619'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir"
	install -Dm444 'openmsx-debugger.desktop' "${pkgdir}/usr/share/applications/openmsx-debugger.desktop"
	cd "$srcdir/${pkgname%-git}/derived/bin"
	install -Dm555 'openmsx-debugger' "${pkgdir}/usr/bin/openmsx-debugger"
	cd "$srcdir/${pkgname%-git}/resources/icons"
	install -Dm444 'openMSX-debugger-logo-16.png' "${pkgdir}/usr/share/icons/hicolor/16x16/apps/openmsx-debugger.png"
	install -Dm444 'openMSX-debugger-logo-32.png' "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openmsx-debugger.png"
	install -Dm444 'openMSX-debugger-logo-48.png' "${pkgdir}/usr/share/icons/hicolor/48x48/apps/openmsx-debugger.png"
	install -Dm444 'openMSX-debugger-logo-64.png' "${pkgdir}/usr/share/icons/hicolor/64x64/apps/openmsx-debugger.png"
	install -Dm444 'openMSX-debugger-logo-128.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openmsx-debugger.png"
	install -Dm444 'openMSX-debugger-logo-256.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openmsx-debugger.png"
}
