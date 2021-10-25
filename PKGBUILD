# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-hydro-git
pkgver=r98.e5f98b8
pkgrel=1
pkgdesc="Ultra-pure, lag-free Fish shell prompt with async git status"
arch=('any')
url="https://github.com/jorgebucaran/hydro"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=('fish-prompt')
replaces=('hydro-git')
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30') ## Jorge Bucaran

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/hydro.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	find functions -type f -exec install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
