# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-autopairs-git
_pkgname="${pkgname%-git}"
pkgver=r402.gee297f2
pkgrel=1
pkgdesc="autopairs for neovim written by lua"
arch=('any')
url="https://github.com/windwp/nvim-autopairs"
license=('MIT')
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
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find doc \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
}

