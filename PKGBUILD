# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-tree-lua-git
pkgver=r388.bfeaf4c
pkgrel=1
pkgdesc="A file tree explorer for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-tree.lua"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim-git')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-nerdtree')
conflicts=("${pkgname%-git}" 'vim-nerdtree')
install=
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
