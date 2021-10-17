# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-deoplete-git
pkgname=(neovim-deoplete-git vim-deoplete-git)
pkgver=6.1.r13.g18788fc
pkgrel=1
pkgdesc="Dark powered asynchronous completion framework"
arch=('any')
url="https://github.com/shougo/deoplete.nvim"
license=('MIT')
depends=('python-msgpack>=1.0.0')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgbase" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package_neovim-deoplete-git() {
	depends+=('neovim>=0.3.0' 'python-pynvim>=0.3.0')
	groups=('neovim-plugins')
	provides=("${pkgbase%-git}")
	conflicts=("${pkgbase%-git}")

	cd "$pkgbase"
	find autoload doc plugin rplugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-deoplete-git() {
	depends+=('vim' 'python-pynvim>=0.3.0' 'nvim-yarp' 'vim-hug-neovim-rpc')
	groups=('vim-plugins')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}" 'neovim-deoplete')

	cd "$pkgbase"
	find autoload doc plugin rplugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
