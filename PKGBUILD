# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin-git
_pkg="${pkgname%-git}"
pkgver=r932.7f5a866
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
install=catppuccin.install
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
	find autoload colors doc lua plugin -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
