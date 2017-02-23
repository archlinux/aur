# Maintainer: David Koňařík <dvd.kon@gmail.com>
pkgname=fsharp-forge
pkgver=1.4.0
pkgrel=1
pkgdesc="F# project management tool"
url="http://forge.run/"
arch=("any")
license=("custom:unlicense")
depends=("fsharp")
source=(
	"https://github.com/fsharp-editing/Forge/releases/download/$pkgver/forge.zip"
	"https://raw.githubusercontent.com/fsharp-editing/Forge/master/LICENSE.txt")
noextract=("https://github.com/fsharp-editing/Forge/releases/download/$pkgver/forge.zip")
sha256sums=(
	"439108f05afaf49d250167de746901e5135d7180cfc6ab5fd7ff0350e01b9c79"
	"7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c")

package() {
	mkdir -p "$srcdir/forge"
	bsdtar x -C "$srcdir/forge" -f "$srcdir/forge.zip"
	rm "$srcdir"/forge/forge.cmd
	chmod +x "$srcdir"/forge/forge.sh
	mkdir -p "$pkgdir"/usr/lib/forge
	cp -r "$srcdir/forge"/* "$pkgdir"/usr/lib/forge
	mkdir -p "$pkgdir"/usr/bin
	ln -s "../lib/forge/forge.sh" "$pkgdir"/usr/bin/forge
	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	cp LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

