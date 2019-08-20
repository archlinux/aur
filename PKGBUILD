# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=cantools-git
pkgver=r59.d6f0a5a
pkgrel=1
pkgdesc='Cantools is a set of libraries and command line tools for handling.'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmatio' 'check')
makedepends=('git' 'bison' 'flex' 'autoconf')
url='https://github.com/aheit/cantools'
source=('cantools-git::git+https://github.com/aheit/cantools')
md5sums=('SKIP')
options=()

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    autoreconf -vif
    ./configure CFLAGS="-fPIC"
}

build() {
    cd $srcdir/$pkgname/
    make
}

package() {
    cd $srcdir/$pkgname/
    make install DESTDIR=$pkgdir
}
