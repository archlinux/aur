# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-session-lens-git
pkgver=r34.4c1754b
pkgrel=1
pkgdesc="Session switcher extension for auto-session"
arch=('any')
url="https://github.com/rmagatti/session-lens"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim>=0.5.0' 'neovim-auto-session' 'neovim-telescope')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=session-lens.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
