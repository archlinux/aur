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
source=("git+https://github.com/zeek/broker")
md5sums=("SKIP")


prepare() {
    cd "$srcdir/broker"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/broker"
    ./configure --disable-python --disable-docs --disable-tests --enable-debug --with-log-level=TRACE
    make -j7
}

package() {
    cd "$srcdir/broker"
    make DESTDIR="$pkgdir/" install
}
