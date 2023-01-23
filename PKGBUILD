# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-telescope-fzf-native-git
_pkgname="${pkgname%-git}"
pkgver=r58.gfab3e22
pkgrel=1
pkgdesc="FZF sorter for telescope written in c"
arch=('any')
url="https://github.com/nvim-telescope/telescope-fzf-native.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-telescope')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make ntest
}

package() {
	cd "$pkgname"
	find build lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

