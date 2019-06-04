# Maintainer: Nick Skelsey <nskelsey+zb@gmail.com>
pkgname=zeek-broker
pkgver=1.1.2.49
pkgrel=1
pkgdesc="The message passing interface for pub/sub brokering with zeek"
arch=('x86_64')
url="https://github.com/zeek/broker"
license=('BSD')
makedepends=("cmake")
depends=("openssl")
source=("src::git+https://github.com/zeek/broker")
md5sums=("SKIP")


prepare() {
    cd "$srcdir/src"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/src"
    ./configure --disable-python --disable-docs --disable-tests
    make -j7
}

package() {
    cd "$srcdir/src"
    make DESTDIR="$pkgdir/" install
}
