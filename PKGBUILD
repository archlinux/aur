# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tree-lua-git
pkgver=r905.6b7b1b3
pkgrel=1
epoch=1
pkgdesc="File tree explorer for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-tree.lua"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('neovim-web-devicons')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=setup.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

PURGE_TARGETS+=('.gitignore')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
