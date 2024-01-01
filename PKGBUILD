# Maintainer: silverhikari (kerrickethan@gmail.com)
pkgname=nim-atlas-git
pkgver=0.6.2.r33.cbba9fa
pkgrel=1
pkgdesc="isolated workspaces manager for nim projects"
arch=('x86_64')
url="https://github.com/nim-lang/atlas"
license=('MIT')
makedepends=('git' 'nim')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nim-lang/atlas')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/atlas"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/atlas"
	nim -d:release c src/atlas.nim
}

package() {
	cd "$srcdir/atlas"
	install -Dm755 "src/atlas" "$pkgdir/usr/bin/atlas"
	install -Dm755 "doc/atlas.md" "$pkgdir/usr/share/doc/atlas/atlas.md"
	install -Dm755 "license.txt" "$pkgdir/usr/share/licenses/atlas/LICENSE"
}
