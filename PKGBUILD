# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-miramare-git
pkgver=r28.ec1b7cf
pkgrel=1
pkgdesc="Comfortable and pleasant colorscheme for Vim"
arch=('any')
url="https://github.com/franbach/miramare"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-miramare' 'vim-lightline-miramare')
conflicts=("${pkgname%-git}")
replaces=('vim-airline-miramare-git' 'vim-lightline-miramare-git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
