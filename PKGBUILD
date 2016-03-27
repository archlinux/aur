pkgname=libmesode-git
pkgver=410.148a0ff
pkgrel=1
pkgdesc="Fork of libstrophe (https://github.com/strophe/libstrophe) for use with Profanity XMPP Client"
arch=('i686' 'x86_64')
url="https://github.com/boothj5/libmesode"
license=('MIT' 'GPL3')
depends=('expat')
makedepends=('git' 'doxygen')
checkdepends=('check')
provides=('libmesode')
conflicts=('libmesode')
source=('git://github.com/boothj5/libmesode.git')
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
    cd "$srcdir/libmesode"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/libmesode"

    ./bootstrap.sh
    ./configure --prefix=/usr
    make
    doxygen
}

check() {
    cd "$srcdir/libmesode"
    make check
}

package() {
    cd "$srcdir/libmesode"
    make DESTDIR="${pkgdir}" install
}
