# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers-git
pkgver=1.4.1.r0.g3a8b221
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
checkdepends=('neovim-plenary')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	find lua plugin syntax \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
