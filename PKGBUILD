# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-grepper-git
pkgver=1.4.r194.g2b93535
pkgrel=1
pkgdesc="Uses your favorite grep tool to asynchronously search"
arch=('any')
url="https://github.com/mhinz/vim-grepper"
license=('MIT')
groups=('vim-plugin')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v.//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
