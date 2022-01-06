# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=('neovim-substrata-git' 'neovim-substrata-extras-git')
pkgver=r40.e1362be
pkgrel=1
pkgdesc="Cold, dark theme ported to Lua"
arch=('any')
url="https://github.com/kvrohit/substrata.nvim"
license=('unknown')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_neovim-substrata-git() {
	depends=('neovim')
	groups=('neovim-plugins')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}" 'vim-substrata')
	install=substrata.install

	cd "$pkgname"
	find colors lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-substrata-extras-git() {
	pkgdesc="extras theme templates for substrata"
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase/extras"
	install -d "$pkgdir/usr/share/substrata/"
	cp -a --no-preserve=ownership * "$pkgdir/usr/share/substrata/"
}
