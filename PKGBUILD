# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-jdtls-git
pkgver=r148.f9aeca2
pkgrel=1
pkgdesc="jdtls extensions for Neovim's built-in LSP"
arch=('any')
url="https://github.com/mfussenegger/nvim-jdtls"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim' 'jdtls')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# install=NAME.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
