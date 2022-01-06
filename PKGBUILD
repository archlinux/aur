# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-zen-mode-git
pkgver=r26.f1cc53d
pkgrel=1
pkgdesc="Full-screen code editing"
arch=('any')
url="https://github.com/folke/zen-mode.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('neovim-twilight')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=zen-mode.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
