# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.23
pkgrel=0
pkgdesc="A complete rewriting of the Tomboy note taking app"
arch=('x86_64')
license=('GPL-3.0')
url="https://wiki.gnome.org/Apps/Tomboy/tomboy-ng"
depends=()
makedepends=('tar')
optdepends=()
source=(
	"https://github.com/tomboy-notes/tomboy-ng/releases/download/V${pkgver}/tomboy-ng_${pkgver}-${pkgrel}_amd64.deb"
)
sha512sums=(
	45b68f0aee6794b476f82e51067c545af1314d776a755a2ad27ae14de28ab1a34d991a8ea2f22280ecb6f0ff92d01758b1c15a51fa034807b3b075a3bf60e0bb
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
