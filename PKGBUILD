# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-dadbod-ui-git
pkgver=r261.5f2bd84
pkgrel=1
pkgdesc="Simple UI for vim-dadbod"
arch=('any')
url="https://github.com/kristijanhusak/vim-dadbod-ui"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim-dadbod')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload doc ftplugin plugin syntax \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
