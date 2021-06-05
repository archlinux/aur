# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=lualine-embark-git
pkgver=r2.e209c39
pkgrel=1
pkgdesc="A port of the Embark colorscheme for Lualine"
arch=('any')
url="https://git.sr.ht/~lmartinez/lualine-embark"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim-lualine')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname"
	install -Dvm 644 lua/lualine/themes/embark.lua -t "$pkgdir/usr/share/nvim/runtime/lua/lualine/themes/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
