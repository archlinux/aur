# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-tokyonight-git
pkgver=r102.0ead86a
pkgrel=1
pkgdesc="Dark and light theme ported from VSCode's TokyoNight"
arch=('any')
url="https://github.com/folke/tokyonight.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
conflicts=("${pkgname%-git}" 'neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors doc lua ! \( -name 'tags' -prune \) \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find extras \
	  -type f -exec install -Dm 644 '{}' -t "$pkgdir/usr/share/$pkgname/" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
