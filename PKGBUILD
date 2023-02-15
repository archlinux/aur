# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-telescope-file-browser-git
_pkgname="${pkgname%-git}"
pkgver=r130.g9c2ff3b
pkgrel=2
pkgdesc="File Browser extension for telescope.nvim"
arch=('any')
url="https://github.com/nvim-telescope/telescope-file-browser.nvim"
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
	find lua doc \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/plugins/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
