# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-highlight-colors-git
_pkgname="${pkgname%-git}"
pkgver=r26.30be040
pkgrel=1
pkgdesc="Highlight color codes in Neovim"
arch=('any')
url="https://github.com/brenoprata10/nvim-highlight-colors"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=highlight-colors.install
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

package() {
	cd "$_pkgname"
	find lua plugin -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
