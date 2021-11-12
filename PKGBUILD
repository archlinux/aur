# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-web-devicons-git
pkgver=r79.f936ff3
pkgrel=2
pkgdesc="A Lua fork of vim-devicons for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-web-devicons"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim' 'nerd-fonts')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-devicons')
conflicts=("${pkgname%-git}" 'vim-devicons')
install=devicons.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin -type f -exec install -Dm 644 '{}' \
		"$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
