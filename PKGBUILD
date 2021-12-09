# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-stabilize-git
pkgver=r36.191d102
pkgrel=1
pkgdesc="Stabilizes buffer content on window events"
arch=('any')
url="https://github.com/luukvbaal/stabilize.nvim"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=stabilize.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('521E78F69DC400BA56D4C424E7D1BC845D39FA83') ## Luuk van Baal
## curl https://github.com/luukvbaal.gpg | gpg --import

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
