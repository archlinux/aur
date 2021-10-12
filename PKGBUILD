# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tree-lua-git
pkgver=1.6.4.r0.gfda5b82
pkgrel=1
pkgdesc="File tree explorer for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-tree.lua"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
optdepends=('neovim-web-devicons')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-nerdtree')
conflicts=("${pkgname%-git}" 'vim-nerdtree')
install=setup.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

PURGE_TARGETS+=('.gitignore')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
