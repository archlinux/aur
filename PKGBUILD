# Maintainer: Nick Skelsey <nskelsey+zb@gmail.com>
pkgname=zeek-broker
pkgver=1.1.2
pkgrel=1
pkgdesc="The message passing interface for pub/sub brokering with zeek"
arch=('x86_64')
url="https://github.com/zeek/broker"
license=('BSD')
makedepends=("cmake")
depends=("openssl")
source=("src::git+https://github.com/zeek/broker#tag=v${pkgver}"
        "third_party::git+https://github.com/zeek/zeek-3rdparty"
        "cmake_mods::git+https://github.com/zeek/cmake")
md5sums=("SKIP" "SKIP" "SKIP")


prepare() {
    cd "$srcdir/src"
    git config submodule.zeek-3rdparty $srcdir/third_party
    git config submodule.cmake $srcdir/cmake_mods
    git submodule update --recursive
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
