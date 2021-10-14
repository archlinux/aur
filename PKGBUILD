# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-latex-symbols-git
pkgver=r21.29dc9e5
pkgrel=1
pkgdesc="nvim-cmp source for LaTeX symbols"
arch=('any')
url="https://github.com/kdheepak/cmp-latex-symbols"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim-cmp')
makedepends=('git' 'julia')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-latex-symbols.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	julia scripts/generate.jl
}

package() {
	cd "$pkgname"
	find after lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
