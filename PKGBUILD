# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=('x16-emulator-bin' 'x16-rom-bin' 'x16-docs-bin')
pkgbase=x16-emulator-bin
pkgver=r36
pkgrel=2
pkgdesc="An emulator for The 8-Bit Guy's Commander X16 (release package)"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=('gendesk')
optdepends=('x16-emulator-bin: X16 emulator'
            'x16-rom-bin: X16 ROMs'
            'x16-docs-bin: X16 documentation')
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=("https://github.com/commanderx16/x16-emulator/releases/download/$pkgver/x16emu_linux-$pkgver.zip"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/$pkgver/.gh/logo.png")
md5sums=('74510e5f2f7386a5f66181d001b9594b'
         '1a858decc66ce2b47a27b24bb836280c')

prepare() {
	gendesk -n --pkgname "${pkgbase%-bin}" --pkgdesc "$pkgdesc" --name "X16 Emulator" --icon "${pkgbase%-bin}" --exec "x16emu" --categories "Game;Emulator"
}

package_x16-emulator-bin() {
	pkgdesc="An emulator for The 8-Bit Guy's Commander X16 (release package)"
	depends=('sdl2')
	arch=('x86_64')
	license=('BSD')
	provides=('x16-emulator')
	conflicts=('x16-emulator')

	install -Dm755 x16emu "$pkgdir/usr/bin/x16emu"
	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-bin}/github-pandoc.css"
	install -Dm644 docs/README.html "$pkgdir/usr/share/doc/${pkgname%-bin}/README.html"
	install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
	install -Dm644 "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}

package_x16-rom-bin() {
	pkgdesc="ROM files for The 8-Bit Guy's Commander X16 (release package)"
	provides=('x16-rom')
	conflicts=('x16-rom')

	install -Dm644 rom.bin "$pkgdir/usr/share/x16-rom/rom.bin"
	install -Dm644 rom.sym "$pkgdir/usr/share/x16-rom/rom.sym"
	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/x16-rom/github-pandoc.css"
	install -Dm644 docs/KERNAL-BASIC.html "$pkgdir/usr/share/doc/x16-rom/KERNAL-BASIC.html"
}

package_x16-docs-bin() {
	pkgdesc="Documentation not found in other packages for The 8-Bit Guy's Commander X16 (release package)"
	provides=('x16-docs')
	conflicts=('x16-docs')

	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/x16-docs/github-pandoc.css"
	install -Dm644 docs/Programmer\'s\ Reference\ Guide.html "$pkgdir/usr/share/doc/x16-docs/Programmer's Reference Guide.html"
	install -Dm644 docs/VERA\ Programmer\'s\ Reference.html "$pkgdir/usr/share/doc/x16-docs/VERA Programmer's Reference.html"
}
