# Maintainer: Gabriel Hansson <gabrielhansson00 at gmail dot com>
pkgname=mason.nvim
pkgver=r1192.2381f50
pkgrel=1
pkgdesc="Package manager focused on IDE language extensions"
arch=('any')
url="https://github.com/williamboman/mason.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'git')
makedepends=('git')
optdepends=(
	'neovim-lspconfig: setup configurations for LSP servers'
	'mason-lspconfig.nvim: bridge mason with lspconfig'
	'npm: for plugins installed from there'
	'luarocks: for plugins installed from there'
	'cargo: for plugins installed from there'
	'nvim-dap: to use installed DAP packages'
	'null-ls: to use installed formatters and linters')
install=mason.nvim.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	find lua doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
}
