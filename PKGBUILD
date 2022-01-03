# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-256noir-git
pkgver=r15.e8668a1
pkgrel=2
pkgdesc="Dark, minimal 256-color colorscheme"
arch=('any')
url="https://github.com/andreasvc/vim-256noir"
license=('custom:unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git' 'python' 'python-docutils' 'python-pygments')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
	rst2man README.rst vim-256noir.1
}

package() {
	cd "$pkgname"
	install -Dm644 colors/256_noir.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dm644 vim-256noir.1 -t "$pkgdir/usr/share/man/man1/"
}
