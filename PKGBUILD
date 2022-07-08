# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lsp_signature-git
pkgver=0.1.1.r82.g86f0310
pkgrel=1
pkgdesc="Neovim plugin for showing LSP signature hints"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
checkdepends=('neovim-plenary')
provides=("${pkgname%-git}" 'neovim-lsp-signature')
conflicts=("${pkgname%-git}")
replaces=('neovim-lsp-signature-git')
install=lsp_signature.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	install -Dm644 lua/lsp_signature/*.lua -t "$pkgdir/usr/share/nvim/runtime/lua/lsp_signature/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
