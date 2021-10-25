# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp_git-git
pkgver=r27.501f910
pkgrel=1
pkgdesc="Git source for neovim-cmp"
arch=('any')
url="https://github.com/petertriho/cmp-git"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim-cmp' 'neovim-plenary' 'git' 'curl')
optdepends=('github-cli' 'gitlab')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-git.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/${pkgname%-git}/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
