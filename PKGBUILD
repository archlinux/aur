# Maintainer: itsme <mymail@ishere.ru>


pkgname=hstr
pkgver=1.25
pkgrel=1
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('any')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('git' 'readline' 'ncurses')
depends=('readline')
source=(git://github.com/dvorka/$pkgname.git#tag=$pkgver)
sha256sums=('SKIP')
conflicts=('hstr-git');


build() {
    cd "$pkgname/dist"
    ./1-dist.sh
    cd ..
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr_curses.h
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/hstr.c
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}

