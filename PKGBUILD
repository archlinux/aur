# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.20
pkgrel=0
pkgdesc="A complete rewriting of the Tomboy note taking app"
arch=('x86_64')
license=('GPL-3.0')
url="https://wiki.gnome.org/Apps/Tomboy/tomboy-ng"
depends=()
makedepends=('tar')
optdepends=()
source=(
	"https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng_${pkgver}-${pkgrel}_amd64.deb"
)
sha512sums=(
	'c5e90344dbf3b164aafe7e86a66a4a2e49566a26bc6e7d5caf64ee0a1319d107598aef25454c549c04de8d807eaa570e071c4ac47436c50e5e0e6427f76089c1'
)

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar xf "$srcdir/data.tar.xz"

	mkdir -p "$pkgdir/usr/share"
	for dir in man applications icons; do
		cp -r "usr/share/$dir" "$pkgdir/usr/share"
	done

	install -Dm755 "usr/bin/tomboy-ng" "$pkgdir/usr/bin/tomboy-ng"
}
