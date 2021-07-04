# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-deus-git
pkgver=r109.1be965e
pkgrel=1
pkgdesc="A better color scheme for the late night coder"
arch=('any')
url="https://github.com/ajmwagar/vim-deus"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 terminal/alacritty.yml deus.json -t "$pkgdir/usr/share/$pkgname/"
}
