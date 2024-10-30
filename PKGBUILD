# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-auto-session-git
pkgver=r343.29a8c77
pkgrel=1
pkgdesc="Small automated session manager"
arch=('any')
url="https://github.com/rmagatti/auto-session"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=auto-session.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
