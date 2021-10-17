# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-ddc-git
pkgname=(vim-ddc-git neovim-ddc-git)
pkgver=0.17.0.r22.gb787b80
pkgrel=1
pkgdesc="Dark deno-powered completion framework"
arch=('any')
url="https://github.com/shougo/ddc.vim"
license=('MIT')
depends=('deno')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgbase" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package_vim-ddc-git() {
	depends+=('vim>=8.2.0662' 'vim-denops')
	groups=('vim-plugins')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	find autoload denops doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-ddc-git() {
	depends+=('neovim>=0.5.0' 'neovim-denops')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}" 'vim-ddc')

	cd "$pkgbase"
	find autoload denops doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
