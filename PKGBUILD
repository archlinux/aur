# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lspconfig-git
pkgver=0.1.0.r0.g428f785
pkgrel=1
pkgdesc="Quickstart configurations for the Neovim LSP client"
arch=('any')
url="https://github.com/neovim/nvim-lspconfig"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lspconfig.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

PURGE_TARGETS=('tags')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 doc/lspconfig.txt -t "$pkgdir/usr/share/nvim/runtime/doc/"
	install -Dm644 README.md doc/server_configurations.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
