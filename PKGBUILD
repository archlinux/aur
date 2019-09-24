# Maintainer: Nick Skelsey <nskelsey+zb@gmail.com>
pkgname=zeek-broker
pkgver=1.2.0.40.gb5aa189
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

pkgver() {
    cd "$srcdir/broker"
    git describe --always | sed 's/^v//;s/dev-/dev/;s/-/./g'
}

build() {
    cd "$srcdir/broker"
    ./configure --prefix=/usr --disable-python --disable-docs --disable-tests
    make -j7
}

package() {
    cd "$srcdir/broker"
    make DESTDIR="$pkgdir/" install
}
