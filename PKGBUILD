# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-npm-git
pkgver=r15.c412be1
pkgrel=1
pkgdesc="npm source for neovim-cmp"
arch=('any')
url="https://github.com/david-kunz/cmp-npm"
license=('Unlicense')
groups=('neovim-plugins')
depends=('neovim-cmp' 'neovim-plenary' 'npm')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-npm.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

PURGE_TARGETS=('.DS_Store')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/${pkgname%-git}/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
