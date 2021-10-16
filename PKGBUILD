# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-neorg-git
pkgver=r388.376e3e6
pkgrel=1
pkgdesc="Org-mode inspired life organization tool"
arch=('any')
url="https://github.com/nvim-neorg/neorg"
license=('GPL3')
groups=('neovim-plugin')
depends=('neovim>=0.5' 'neovim-plenary')
optdepends=(
	'neovim-tree-sitter'
	'neovim-cmp: completion engine')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-cmp-neorg')
conflicts=("${pkgname%-git}" 'neovim-cmp-neorg')
install=neorg.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

PURGE_TARGETS=('tags')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc docs ftdetect lua queries -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
