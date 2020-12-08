# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=suda-vim-git
pkgver=r70.45f88d4
pkgrel=1
pkgdesc="An alternative sudo.vim for Vim and Neovim ."
arch=('i686' 'x86_64')
url="https://github.com/lambdalisue/suda.vim"
license=('custom')
groups=()
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/lambdalisue/suda.vim#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p $pkgdir/usr/share/nvim/site/{plugin,doc,autoload}
    cd "$srcdir/${pkgname%-git}"
    cp -r plugin/* $pkgdir/usr/share/nvim/site/plugin/
    cp doc/suda.txt $pkgdir/usr/share/nvim/site/doc/
    cp autoload/suda.vim $pkgdir/usr/share/nvim/site/autoload/
    mkdir -p $pkgdir/usr/share/licenses/suda-vim
    cp LICENSE $pkgdir/usr/share/licenses/suda-vim
}
