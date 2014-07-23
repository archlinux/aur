# Maintainer: Joris Steyn <jorissteyn@gmail.com>

pkgname=vim-gitgutter-git
pkgver=217.83ace20
pkgrel=2
pkgdesc="A Vim plugin which shows a git diff in the 'gutter'"
arch=('any')
url="https://github.com/airblade/vim-gitgutter.git"
license=('MIT')
depends=('vim')
makedepends=('git')
source=('git://github.com/airblade/vim-gitgutter.git#branch=master')
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
    cd "$SRCDEST"/vim-gitgutter
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    install -d "$pkgdir"/usr/share/vim/vimfiles/autoload/gitgutter

    install -Dm644 "$srcdir"/vim-gitgutter/autoload/gitgutter.vim \
        "$pkgdir"/usr/share/vim/vimfiles/autoload/gitgutter.vim

    install -Dm644 "$srcdir"/vim-gitgutter/plugin/gitgutter.vim \
        "$pkgdir"/usr/share/vim/vimfiles/plugin/gitgutter.vim

    install -Dm644 "$srcdir"/vim-gitgutter/doc/gitgutter.txt \
        "$pkgdir"/usr/share/vim/vimfiles/doc/gitgutter.txt

    for file in $(find "$srcdir"/vim-gitgutter/autoload/gitgutter/ -type f -name *.vim); do
        install -Dm644 "$file" "$pkgdir"/usr/share/vim/vimfiles/"${file#${srcdir}/vim-gitgutter}"
    done
}
