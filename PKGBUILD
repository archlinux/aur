# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-test-git
pkgver=2.1.0.r379.g5fe8ada
pkgrel=1
pkgdesc="Vim wrapper for running tests at different granularities"
arch=('any')
url="https://github.com/vim-test/vim-test"
license=('custom:vim')
groups=('vim-plugin')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=test.install
source=("$pkgname::git+$url?signed"
        'LICENSE')
sha256sums=('SKIP'
            'ce338bdebfc2cb38380b598d0bb482d582d01338ce8d82ffb6412dc404286100')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname"
	find autoload doc plugin spec -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
