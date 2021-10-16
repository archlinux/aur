# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-lspconfig-git
pkgname=(neovim-lspconfig-git neovim-lspconfig-docs-git)
pkgver=r1350.0da5759
pkgrel=1
pkgdesc="Quickstart configurations for the Neovim LSP client"
arch=('any')
url="https://github.com/neovim/nvim-lspconfig"
license=('Apache')
groups=('neovim-plugins')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_neovim-lspconfig-git() {
	depends=('neovim>=0.5.0')
	optdepends=('neovim-lspconfig-docs')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	install="$pkgname.install"

	cd "$pkgbase"
	find autoload doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-lspconfig-docs-git() {
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 ADVANCED_README.md CONFIG.md -t "$pkgdir/usr/share/doc/$pkgbase/"
}
