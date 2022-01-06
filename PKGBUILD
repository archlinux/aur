# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-twilight-git
pkgver=r17.8ab43c0
pkgrel=1
pkgdesc="Dims inactive portions of code during editing"
arch=('any')
url="https://github.com/folke/twilight.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=twilight.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('97ADEDA7F079E45EF2AD1004707FE6FEB82F7984') # Folke Lemaitre

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
