# Maintainer: LevitatingBusinessMan <me at levitati.ng>
pkgbase=otf-monocraft-git
pkgname=(otf-monocraft-git ttf-monocraft-git)
pkgver=r157.e79ff56
pkgrel=1
pkgdesc="Minecraft-based monospace font"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('unknown')
depends=()
makedepends=('git' 'fontforge')
provides=("otf-monocraft")
conflicts=("otf-monocraft")
source=("Monocraft::git+https://github.com/IdreesInc/Monocraft.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Monocraft"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/Monocraft/src"
	python monocraft.py
}

package_ttf-monocraft-git() {
	provides=("ttf-monocraft")
	conflicts=("ttf-monocraft")
	cd "$srcdir/Monocraft"
 	install -Dm644 "dist/Monocraft.ttf" "$pkgdir/usr/share/fonts/TTF/Monocraft.ttf"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_otf-monocraft-git() {
	provides=("otf-monocraft")
	conflicts=("otf-monocraft")
	cd "$srcdir/Monocraft"
 	install -Dm644 "dist/Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
