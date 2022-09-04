# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-matchparen-git
_pkg="${pkgname%-git}"
pkgver=r137.6860f53
pkgrel=1
pkgdesc='Alternative neovim matchparen plugin'
arch=('any')
url="https://github.com/monkoose/matchparen.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
install=matchparen.install
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

package() {
	cd "$_pkg"
	find doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
