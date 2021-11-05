# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-speeddating-git
pkgver=20151024.r6.g95da3d7
pkgrel=1
pkgdesc="Proper date incrementing for Vim"
arch=('any')
url="https://github.com/tpope/vim-speeddating"
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
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname/"
}
