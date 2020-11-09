# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
_pkgname=vim-vsnip
pkgname=${_pkgname}-git
pkgver=master
pkgrel=1
pkgdesc="VSCode(LSP)'s snippet feature in vim."
arch=('any')
url="https://github.com/hrsh7th/vim-vsnip"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
optdepends=('vim-vsnip-integ: LSP Client support')
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
	cp -dr --no-preserve=ownership autoload doc misc plugin "$vimfiles"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
