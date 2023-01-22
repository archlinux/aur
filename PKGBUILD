# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-lspkind-git
_pkgname="${pkgname%-git}"
pkgver=r61.gc68b3a0
pkgrel=1
pkgdesc="vscode-like pictograms for neovim lsp completion items"
arch=('any')
url="https://github.com/onsails/lspkind.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
optdepends=(
	'neovim-cmp')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

package() {
	cd "$pkgname"
	find lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

