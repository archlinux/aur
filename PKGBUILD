# Maintainer: itsme <mymail@ishere.ru>
# Contributor: Christian Wieden <wiedenchr at gmail dot com>

pkgname=hstr
pkgver=3.0
pkgrel=1
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('x86_64')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
depends=('readline')
source=("https://github.com/dvorka/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6d523914dc3af243f5895b2e52d39e3cc53f1afed6562f34a29da4d4467ad7fa')


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

