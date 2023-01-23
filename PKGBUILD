# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-telescope-ui-select-git
_pkgname="${pkgname%-git}"
pkgver=r9.g62ea5e5
pkgrel=1
pkgdesc="Neovim Telescope extension to set vim.ui.select to telescope"
arch=('any')
url="https://github.com/nvim-telescope/telescope-ui-select.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-telescope')
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
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

