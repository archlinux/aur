# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Contributor: Aryan Ghasemi <aryangh1379@gmail.com>
pkgname=supertux-advance
pkgver=0.2.0
pkgrel=3
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

depends=('brux-gdk')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-exec" "$pkgname.desktop")
sha256sums=('54ec98cfa37adc972e099cf7a143af84958e4b120a1d3173cc417094a4c430d0' 'SKIP' 'SKIP')

package() {
	# Executable and Desktop file
    cd "${srcdir}"
	install -Dm755 "$pkgname-exec" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	# Source files
	install -dm755 "$pkgdir/opt/$pkgname/src"
	install -dm755 "$pkgdir/opt/$pkgname/res"
	install -dm755 "$pkgdir/opt/$pkgname/lang"
	install -dm755 "$pkgdir/opt/$pkgname/contrib"
	install -dm755 "$pkgdir/opt/$pkgname/mods"

	cp -r "$pkgname-$pkgver/src/"* "$pkgdir/opt/$pkgname/src/"
	cp -r "$pkgname-$pkgver/res/"* "$pkgdir/opt/$pkgname/res/"
	cp -r "$pkgname-$pkgver/lang/"* "$pkgdir/opt/$pkgname/lang/"
	cp -r "$pkgname-$pkgver/contrib/"* "$pkgdir/opt/$pkgname/contrib/"

	# Remove on next release
	rm -rf "$pkgdir/opt/$pkgname/contrib/azzy"

	cp -r "$pkgname-$pkgver/mods/"* "$pkgdir/opt/$pkgname/mods/"

	install -Dm644 "$pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
	install -Dm644 "$pkgname-$pkgver/icon.png" "$pkgdir/opt/$pkgname/icon.png"
	install -Dm644 "$pkgname-$pkgver/supertuxadvance.ico" "$pkgdir/opt/$pkgname/supertuxadvance.ico"

	install -Dm644 "$pkgname-$pkgver/game.brx" "$pkgdir/opt/$pkgname/game.brx"

	install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/opt/$pkgname/README.md"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
}
