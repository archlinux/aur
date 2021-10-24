# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-abbreviation-tips-git
pkgver=0.5.1.r40.ge877e28
pkgrel=1
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.1.0')
makedepends=('git')
checkdepends=('fish-fishtape')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

check() {
	cd "$pkgname"
	fish -Pc "fishtape test/*"
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/abbr_tips.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find functions -type f -exec install -Dm644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
}
