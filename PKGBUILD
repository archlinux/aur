# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=pandabin-git
pkgver=r85.996b17a
pkgrel=1

pkgdesc='A self-hostable, simple and fast pastebin written in C'
url='https://github.com/HalosGhost/pandabin'
arch=('i686' 'x86_64')
license=('GPL2')

provides=('pandabin')
conflicts=('pandabin')

depends=('lwan' 'libutil-linux' 'openssl' 'sqlite3')
makedepends=('git' 'tup' 'clang')

source=('git+https://github.com/HalosGhost/pandabin.git')
sha256sums=('SKIP')

pkgver () {
    cd pandabin
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd pandabin
    ./configure --prefix='/usr'
}

build () {
    cd pandabin
    make
}

package () {
    cd pandabin
    make DESTDIR="${pkgdir}" install
}
