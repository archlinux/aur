# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tokyonight
_pkg=tokyonight.nvim
pkgver=4.14.1
pkgrel=1
pkgdesc="Dark and light theme ported from VSCode's TokyoNight"
arch=('any')
url="https://github.com/folke/tokyonight.nvim"
license=('MIT')
groups=('neovim-plugins')
provides=('neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
conflicts=('neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5fc8b8fd3bc34f1843e6b4d504e2e4d178ad5dae88e5e5613649db333663d567')

package() {
    depends=('neovim')
	local dirs=(autoload colors doc lua)
	cd "$_pkg-$pkgver"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
	find extras -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
