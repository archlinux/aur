# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-dispatch-git
pkgver=1.8.r33.ga99a671
pkgrel=1
pkgdesc="Asynchronous build and test dispatcher"
arch=('any')
url="https://github.com/tpope/vim-dispatch"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload doc plugin \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}
