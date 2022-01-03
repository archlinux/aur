# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-git-blame-git
pkgver=r49.5bf6b1b
pkgrel=1
pkgdesc="Git-blame plugin for Neovim"
arch=('any')
url="https://github.com/f-person/git-blame.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
