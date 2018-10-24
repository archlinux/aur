# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.18
pkgrel=0
pkgdesc="A complete rewriting of the Tomboy note taking app"
arch=('x86_64')
license=('GPL-3.0')
url="https://wiki.gnome.org/Apps/Tomboy/tomboy-ng"
depends=()
makedepends=('tar')
optdepends=()
source=(
	"https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng_${pkgver}b-${pkgrel}_amd64.deb"
)
sha512sums=(
	'9016218d68b68d3da6872e57c9dc1a82e3ad0a8b2ec97b7e0354843fcaa1ebe8e4c7f7c2cd93f71b53783d1e619a208d8f05b707a51403eb8e23703414787bd0'
)

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar xf "$srcdir/data.tar.xz"

	mkdir -p "$pkgdir/usr/share"
	for dir in man applications icons; do
		echo $dir
		cp -rv "usr/share/$dir" "$pkgdir/usr/share"
	done
	install -Dm755 "usr/bin/tomboy-ng" "$pkgdir/usr/bin/tomboy-ng"
}
