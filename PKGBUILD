# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
_pkgname=supertux-advance
pkgname=supertux-advance-bin
pkgver=0.2.0
pkgrel=3
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

depends=('brux-gdk')
provides=("supertux-advance")
conflicts=("supertux-advance")

source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/sta-${pkgver}.zip" "$_pkgname-exec" "$_pkgname.desktop")
sha256sums=('781cf8012fa4b79bdbd135b9d6b9244a287dcbcabcef2e6c451e8f00520aba72' 'SKIP' 'SKIP')

package() {
	# Executable and Desktop file
    cd "${srcdir}"
	install -Dm755 "$_pkgname-exec" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# Source files
	install -dm755 "$pkgdir/opt/$_pkgname/src"
	install -dm755 "$pkgdir/opt/$_pkgname/res"
	install -dm755 "$pkgdir/opt/$_pkgname/lang"
	install -dm755 "$pkgdir/opt/$_pkgname/contrib"
	install -dm755 "$pkgdir/opt/$_pkgname/mods"

	cp -r "src/"* "$pkgdir/opt/$_pkgname/src/"
	cp -r "res/"* "$pkgdir/opt/$_pkgname/res/"
	cp -r "lang/"* "$pkgdir/opt/$_pkgname/lang/"
	cp -r "contrib/"* "$pkgdir/opt/$_pkgname/contrib/"

	# Remove on next release
	rm -rf "$pkgdir/opt/$_pkgname/contrib/azzy"

	cp -r "mods/"* "$pkgdir/opt/$_pkgname/mods/"

	install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
	install -Dm644 "icon.png" "$pkgdir/opt/$_pkgname/icon.png"
	install -Dm644 "supertuxadvance.ico" "$pkgdir/opt/$_pkgname/supertuxadvance.ico"

	install -Dm644 "game.brx" "$pkgdir/opt/$_pkgname/game.brx"
	install -Dm644 "sta" "$pkgdir/opt/$_pkgname/sta"

	install -Dm644 "README.md" "$pkgdir/opt/$_pkgname/README.md"
	install -Dm644 "LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"
}
