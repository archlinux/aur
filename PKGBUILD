# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-hop-git
pkgver=r153.9c849da
pkgrel=1
pkgdesc="A plugin that lets you jump anywhere in a document with as few keystrokes as possible"
arch=('any')
url="https://github.com/phaazon/hop.nvim"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=hop.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
