# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode-git
pkgver=0.2.1.r226.g95f9273
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=orgmode.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc ftplugin indent lua syntax -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md DOCS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
