# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=neovim-rose-pine-git
_pkgname=neovim-rose-pine
pkgver=r261.15aac8c
pkgrel=1
pkgdesc="Port of the dark Rose Pine colorscheme for neovim. Includes lualine theme."
arch=('any')
url="https://github.com/rose-pine/neovim"
license=('custom:MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
install="$pkgname.install"
source=("neovim-rose-pine::git+https://github.com/rose-pine/neovim")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	find colors lua -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm 644 license -t "$pkgdir/usr/share/licenses/$pkgname/"
}
