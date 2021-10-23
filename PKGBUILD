# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-persistence-git
pkgver=r9.77cf5a6
pkgrel=1
pkgdesc="Simple session management for Neovim"
arch=('any')
url="https://github.com/folke/persistence.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=persistence.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=(
	'97ADEDA7F079E45EF2AD1004707FE6FEB82F7984' ## Folke Lemaitre (folke)
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
