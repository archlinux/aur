# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=vim-tickscript-git
_pkgname=${pkgname%-git}
pkgver=r8.399e332
pkgrel=2
pkgdesc="Vim syntax highlighting for TICKscript"
arch=('any')
url="https://github.com/nathanielc/vim-tickscript"
license=('MIT')
depends=('vim')
optdepends=('tickfmt')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/nathanielc/vim-tickscript')
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        # Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
        for dir in autoload/ ftdetect/ plugin/ syntax/; do
                cp --recursive "${dir}" "$vimdir"
        done
}
