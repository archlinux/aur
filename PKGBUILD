# Maintainer: itsme <mymail@ishere.ru>
# Maintainer: Christian Wieden <wiedenchr at gmail dot com>

pkgname=hstr
pkgver=2.3
pkgrel=2
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('any')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
depends=('readline')
source=("https://github.com/dvorka/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c7e7408671757b3f4be9c5a59b4e2d56e7a7b601ace2a94eb6b2b61f20ee890b')
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
    install -D -p -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -p -m 644 Changelog "${pkgdir}/usr/share/doc/${pkgname}/Changelog"
    install -D -p -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

