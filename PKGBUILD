# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=vim-jq-git
_pkgname=${pkgname%-git}
pkgver=r20.99d55a3
pkgrel=1
pkgdesc="Syntax highlighting for jq script files"
arch=('any')
url="https://github.com/vito-c/jq.vim"
depends=('vim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+https://github.com/vito-c/jq.vim")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
        for dir in ftdetect/ syntax/; do
                cp --recursive "${dir}" "$vimdir/"
        done
}
