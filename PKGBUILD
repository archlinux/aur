# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-crates-git
pkgver=r108.ab2c491
pkgrel=1
pkgdesc="Neovim plugin that manages crates.io dependencies"
arch=('any')
url="https://github.com/saecki/crates.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary' 'cargo')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-cmp-crates')
conflicts=("${pkgname%-git}" 'neovim-cmp-crates')
install=crates.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find after lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
