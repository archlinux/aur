# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# https://github.com/Matteo842/SaveState/archive/refs/tags/1.4.1.tar.gz

# Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate-bin
pkgver=1.4.2c
pkgrel=1
epoch=
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64' 'i686')
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
	"$pkgname-$pkgver.tar.gz::https://github.com/Matteo842/SaveState/releases/download/$pkgver/SaveState-$pkgver-Linux.zip"
	"SaveState.png::https://github.com/Matteo842/SaveState/blob/$pkgver/icon.png?raw=true"
)
noextract=()
sha256sums=(
	'cd4c3c4e3c156d81fb16e81097e76571fc95c01dbeeba24dce59f20518beab7b'
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
