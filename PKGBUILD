# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
_pkgname=vim-vsnip-integ
pkgname=${_pkgname}-git
pkgver=master
pkgrel=3
pkgdesc="vim-vsnip integration with other plugins(LSP clients, completion engines)"
arch=('any')
url="https://github.com/hrsh7th/$_pkgname"
license=('MIT')
groups=('vim-plugins')
depends=('vim-vsnip-git')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	local vimfiles="$pkgdir/usr/share/vim/vimfiles/"
	install -d "$vimfiles"
	cp -dr --no-preserve=ownership after autoload doc plugin "$vimfiles"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
