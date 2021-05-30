# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-sideways-git
pkgver=0.4.0.r47.g9ce855a
pkgrel=1
pkgdesc="A Vim plugin to switch around function arguments in-place"
arch=('any')
url="https://github.com/andrewradev/sideways.vim"
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
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload doc ftplugin plugin spec \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
