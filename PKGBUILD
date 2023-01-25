# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-fold-cycle-git
_pkgname="${pkgname%-git}"
pkgver=r15.g35bb75c
pkgrel=1
pkgdesc="This neovim plugin allows you to cycle folds open or closed"
arch=('any')
url="https://github.com/jghauser/fold-cycle.nvim"
license=('GPL')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

package() {
	cd "$pkgname"
	find lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/plugins/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
