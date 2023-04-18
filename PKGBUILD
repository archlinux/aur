# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbifetch-git
_pkg="${pkgname%-git}"
pkgver=r26.987f87d
pkgrel=2
pkgdesc="Hilbish-optimized screenfetch"
arch=('any')
url="https://github.com/rosettea/hilbifetch"
license=('BSD')
depends=('hilbish')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
backup=('etc/hfconf.lua')
install="$pkgname.install"
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'784DF7A14968C5094E16839C904FC49417B44DCD' ## sammy (TorchedSammy)
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dv hilbifetch.lua "$pkgdir/usr/bin/hilbifetch"
	install -Dvm644 hfconf.lua -t "$pkgdir/etc/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
