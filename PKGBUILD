# Maintainer: dringsim <dringsim@qq.com>

pkgname=neovim-rainbow-delimiters-git
pkgver=0.8.0.r27.g011d98e
pkgrel=1
pkgdesc="Rainbow delimiters for Neovim with Tree-sitter"
arch=('any')
url="https://github.com/HiPhish/rainbow-delimiters.nvim"
license=('Apache-2.0')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload lua plugin queries -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 doc/rainbow-delimiters.txt -t "$pkgdir/usr/share/nvim/runtime/doc/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

