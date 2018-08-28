# Maintainer: itsme <mymail@ishere.ru>


pkgname=hstr
pkgver=2.0
pkgrel=1
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('any')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
depends=('readline')
source=("https://github.com/dvorka/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8d93ed8bfee1a979e8d06646e162b70316e2097e16243636d81011ba1000627a')
conflicts=('hstr-git');


build() {
    cd "$pkgname-$pkgver/build/tarball"
    ./tarball-automake.sh
    cd ../..
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr_curses.h
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr.h
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

