# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lint-git
pkgver=r93.214b3d9
pkgrel=1
pkgdesc="Asynchronous linter plugin"
arch=('any')
url="https://github.com/mfussenegger/nvim-lint"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
checkdepends=('neovim-plenary' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lint.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$pkgname"
	nvim --headless --noplugin -u tests/minimal.vim -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal.vim'}"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
