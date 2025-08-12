# Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate-bin
pkgver=1.4.3
pkgrel=1
epoch=
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64')
url="https://github.com/Matteo842/SaveState"
license=('GPL-3.0-only')
groups=()
depends=('glibc' 'zlib')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=(savestate)
conflicts=(savestate)
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.zip::https://github.com/Matteo842/SaveState/releases/download/$pkgver/SaveState-$pkgver-Linux.zip"
	"SaveState.png::https://github.com/Matteo842/SaveState/blob/$pkgver/icon.png?raw=true"
)
noextract=()
sha256sums=(
	'ec3443ed2a0d435833a1ce521db4298598a114c06994377bbd34f176965bc0c2'
	'7f7b294aa10ef51f23dbccd814e2ce507269be889e444f2bf2b1fb5c50dcb15e'
)
validpgpkeys=()
_name="SaveState"
_categories=('Game;Utility')
_exec="/usr/bin/SaveState"

prepare() {
	cd "$srcdir"

	gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" \
		--categories=$_categories \
		--name=$_name \
		--genericname=$_name \
		--exec=$_exec \
		--icon=$_name

}

package() {
	cd "$srcdir"

	install -Dm0755 -t "$pkgdir/usr/share/applications/" "savestate.desktop"
	install -Dm0755 -t "$pkgdir/usr/share/icons/" "$_name.png"

	install -Dm0755 -t "$pkgdir/usr/bin" "SaveState"
}
