# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=hstr
pkgver=3.2
pkgrel=1
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('x86_64')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
depends=('readline')
source=("https://github.com/dvorka/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bceab1cb3c3b636d9ff4dfbaf8b035530e76a36d948767ed1735c4e79d7473eb')


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
