pkgname=bytesize-git
pkgver=1.10.0
pkgrel=1
arch=('any')
pkgdesc='Convert between Binary & SI Bytes' 
url='https://github.com/jmdaemon/bytesize'
license=('AGPL3')
depends=('logc' 'glibc' 'gmp' 'mpfr')
optdepends=()
makedepends=('make')
source=("$pkgname::git+https://github.com/jmdaemon/bytesize")
provides=(bytesize)
conflicts=(bytesize)
sha512sums=("SKIP")

build() {
    cd "$pkgname"
    git submodule init
    git submodule update
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    make release bin
    make release lib
}

package-bin() {
    BIN_DIR="$pkgdir"/usr/bin
    mkdir -p $BIN_DIR
    install build/release/bin/bytesize $BIN_DIR/bytesize
}

package-lib() {
    LIB_DIR="$pkgdir"/usr/lib
    INC_DIR="$pkgdir"/usr/include
    mkdir -p $LIB_DIR $INC_DIR
    install build/release/lib/libbytesize.so $LIB_DIR/libbytesize.so
    install include/bytesize.h $INC_DIR/bytesize.h
}

package() {
    cd "$pkgname"
    package-bin
    package-lib
}
