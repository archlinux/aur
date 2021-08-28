# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-diffview-git
pkgver=r44.e0ffb1c
pkgrel=1
pkgdesc="Single tabpage interface for cycling through diffs for all modified files"
arch=('any')
url="https://github.com/sindrets/diffview.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.5' 'git')
optdepends=('neovim-web-devicons')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=diffview.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
