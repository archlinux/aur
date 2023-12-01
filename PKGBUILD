# Maintainer: Max Gautier <mg@max.gautier.name>

_pkgname=vim-helm
pkgname="$_pkgname"-git
pkgver=master
pkgrel=1
pkgdesc="Helm syntax for vim"
arch=('any')
url="https://github.com/towolf/$_pkgname"
license=('custom')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+$url#branch=master?signed")
sha512sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

    cd "$pkgname"

    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

    # Install vimfiles
    local vimfiles="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$vimfiles"
	cp -r --no-preserve=ownership -t "$vimfiles" syntax/ ftdetect/
}
