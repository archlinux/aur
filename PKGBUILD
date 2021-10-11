# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-onedark-git
pkgver=0.1.0.r12.gbef8485
pkgrel=1
pkgdesc="OneDark Neovim colorscheme"
arch=('any')
url="https://github.com/monsonjeremy/onedark.nvim"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim>=0.5')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-lualine-onedark')
conflicts=("${pkgname%-git}" 'neovim-lualine-onedark')
install=onedark.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=(
	'8C7BFFA82499750664C8AA811E149DA4B81CF897'   ## Monson Jeremy
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')  ## GitHub

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find lua colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find extras -type f -exec install -Dm 644 -t "$pkgdir/usr/share/${pkgname%-git}/" '{}' \+
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
