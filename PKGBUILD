# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lush-git
pkgver=1.0.0.r0.gfa7694f
pkgrel=1
pkgdesc="A colorscheme creation aid for Neovim"
arch=('any')
url="https://github.com/rktjmp/lush.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lush.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc examples lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
