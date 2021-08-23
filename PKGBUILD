# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gps-git
pkgver=r27.cffae25
pkgrel=1
pkgdesc="A simple statusline component that shows context of the current cursor position in file"
arch=('any')
url="https://github.com/smiteshp/nvim-gps"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5' 'neovim-tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gps.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
