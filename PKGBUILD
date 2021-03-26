# Maintainer: Aaron Ky-Riesenbach <aaronkyriesenbach at pobox dot com>
pkgname=nullpomino-slick
pkgver=7.5.0
pkgrel=1

pkgdesc="An action puzzle game"
arch=("any")
url="https://github.com/nullpomino/nullpomino"
license=("BSD")

depends=("java-runtime>=1.5")
makedepends=("git")
conflicts=("nullpomino-git")

source=("NullpoMino${pkgver}_linux.tar.gz::https://github.com/nullpomino/nullpomino/releases/download/v$pkgver/NullpoMino${pkgver}_linux.tar.gz"
		"$pkgname.desktop")
md5sums=("SKIP" "caba0042fe874a90568b32304557dbb2")

package() {
	_src="$srcdir/NullpoMino$(sed 's/\./_/g' <<< $pkgver)"

	install -Dm644 "$_src/LICENCE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -d "$pkgdir/opt/nullpomino/config"
	cp -R $_src/config/* "$pkgdir/opt/nullpomino/config/"
	chmod -R 777 "$pkgdir/opt/nullpomino/config/"
	rm -r "$_src/config/"
	cp -r $_src/* "$pkgdir/opt/nullpomino/"
}
