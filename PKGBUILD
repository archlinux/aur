# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
_pkgname=supertux-advance
pkgname=supertux-advance-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

depends=('brux-gdk')
makedepends=('git')
provides=("supertux-advance")

source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "$_pkgname-exec" "$_pkgname.desktop")
sha256sums=('54ec98cfa37adc972e099cf7a143af84958e4b120a1d3173cc417094a4c430d0' 'SKIP' 'SKIP')

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

	cp -r "$_pkgname-$pkgver/src/"* "$pkgdir/opt/$_pkgname/src/"
	cp -r "$_pkgname-$pkgver/res/"* "$pkgdir/opt/$_pkgname/res/"
	cp -r "$_pkgname-$pkgver/lang/"* "$pkgdir/opt/$_pkgname/lang/"
	cp -r "$_pkgname-$pkgver/contrib/"* "$pkgdir/opt/$_pkgname/contrib/"

	# Remove on next release
	rm -rf "$pkgdir/opt/$_pkgname/contrib/azzy"

	cp -r "$_pkgname-$pkgver/mods/"* "$pkgdir/opt/$_pkgname/mods/"

	install -Dm644 "$_pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
	install -Dm644 "$_pkgname-$pkgver/icon.png" "$pkgdir/opt/$_pkgname/icon.png"
	install -Dm644 "$_pkgname-$pkgver/supertuxadvance.ico" "$pkgdir/opt/$_pkgname/supertuxadvance.ico"

	install -Dm644 "$_pkgname-$pkgver/game.brx" "$pkgdir/opt/$_pkgname/game.brx"

	install -Dm644 "$_pkgname-$pkgver/README.md" "$pkgdir/opt/$_pkgname/README.md"
	install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"
}
