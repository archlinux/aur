# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-z-git
pkgver=1.1.r58.g45a9ff6
pkgrel=2
pkgdesc="Fish port of z, for directory jumping"
arch=('any')
url="https://github.com/jethrokuan/z"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("${pkgname%-git}" 'z')
conflicts=("${pkgname%-git}" 'z' 'zoxide')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	## upstream has extra tags; filter them out with --match
	git -C "$pkgname" describe --long --tags --match "[0-9]*" | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/z.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm 644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dm 644 man/man1/z.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
