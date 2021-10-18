# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-scrollview-git
pkgver=2.4.2.r15.gfb35d9d
pkgrel=1
pkgdesc="Neovim plugin that displays interactive vertical scrollbars"
arch=('any')
url="https://github.com/dstein64/nvim-scrollview"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

PURGE_TARGETS=('tags')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
