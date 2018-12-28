# Maintainer: Christian Wieden <wiedenchr at gmail dot com
# Contributer: Ricardo Band <me at xengi dot de>
# Contributor: Filip Szymański <fszymanski at, fedoraproject.org>

pkgname=hstr-git
pkgver=2.0.r21.g329e124
pkgrel=1
pkgdesc="A command line utility that brings improved BASH command completion from the history. It aims to make completion easier and more efficient than Ctrl-r."
arch=('any')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('git' 'readline' 'ncurses')
depends=('readline')
source=(git://github.com/dvorka/hstr.git#branch=master)
md5sums=('SKIP')
conflicts=('hh');

build() {
    cd "hstr/build/tarball"
    ./tarball-automake.sh
    cd ../..
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr_curses.h
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr.h
    ./configure --prefix=/usr
    make
}

package() {
    cd "hstr"
    make DESTDIR="$pkgdir/" install
}

pkgver() {
    cd "hstr"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
