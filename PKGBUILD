# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-neogen-git
pkgver=r161.19a222a
pkgrel=1
pkgdesc="Annotation generator for multiple languages and conventions"
arch=('any')
url="https://github.com/danymat/neogen"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim' 'neovim-tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=neogen.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	# install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find docs README.md \
		-type f \
		-exec install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
