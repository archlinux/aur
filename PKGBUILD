# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-git-git
pkgver=r88.2d78e6e
pkgrel=1
pkgdesc="Git source for neovim-cmp"
arch=('any')
url="https://github.com/petertriho/cmp-git"
license=('MIT')
groups=('neovim-plugins')
depends=('curl' 'git' 'neovim')
optdepends=('github-cli' 'gitlab-glab')
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
	find lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
