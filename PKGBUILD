# Maintainer: The Lemon Man

pkgname=armips-git
pkgver=20150903.8bd93be
pkgrel=1
pkgdesc='MIPS/ARM assembler'
arch=('i686' 'x86_64')
url='https://github.com/Kingcom/armips'
license=('MIT')
makedepends=('git' 'cmake')
provides=('armips')
conflicts=('armips')
source=('git+https://github.com/Kingcom/tinyformat'
        'git+https://github.com/Kingcom/armips.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/armips"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
    cd "$srcdir/armips"

    git submodule init
    git config submodule.ext/tinyformat.url "$srcdir"/tinyformat
    git submodule update ext/tinyformat
}

build() {
    cd "$srcdir/armips"
    cmake .
    make
}

package() {
    cd "$srcdir/armips"
    mkdir -p "$pkgdir"/usr/bin
    install -Dm755 armips "$pkgdir"/usr/bin/armips
}
