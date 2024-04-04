# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lush-git
pkgver=2.0.1.r50.gbc12f01
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
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	dir=(doc examples lua plugin spec)
	find "${dir[@]}" -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
