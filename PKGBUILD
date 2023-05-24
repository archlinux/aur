# Maintainer: spiritomb <spiritomb at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tokyonight-git
_pkg="${pkgname%-git}"
pkgver=1.20.0.r0.gd0baf68
pkgrel=1
pkgdesc="Dark and light theme ported from VSCode's TokyoNight"
arch=('any')
url="https://github.com/folke/tokyonight.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("$_pkg" 'neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
conflicts=("$_pkg" 'neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --match "v[0-9]*" --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local dirs=(autoload colors doc lua)
	cd "$pkgname"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find extras -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$_pkg/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
