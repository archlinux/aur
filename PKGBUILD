# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbifetch-git
pkgver=r26.987f87d
pkgrel=1
pkgdesc="Hilbish-optimized screenfetch"
arch=('any')
url="https://github.com/rosettea/hilbifetch"
license=('BSD')
depends=('hilbish>=0.4.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/hfconf.lua')
install="$pkgname.install"
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'098F50DFBCEEC71A4EAB6DA450EE40A2809851F5' ## sammy (TorchedSammy)
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -D hilbifetch.lua "$pkgdir/usr/bin/hilbifetch"
	install -Dm 644 hfconf.lua -t "$pkgdir/etc/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
