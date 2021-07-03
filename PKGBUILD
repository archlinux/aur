# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-moonlight-git
pkgver=r164.e24e421
pkgrel=2
pkgdesc="A Lua port of VSCode's Moonlight colorscheme with builtin support for other plugins"
arch=('any')
url="https://github.com/shaunsingh/moonlight.nvim"
license=('GPL')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-lualine-moonlight')
conflicts=("${pkgname%-git}" 'neovim-lualine-moonlight')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find colors lua -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
