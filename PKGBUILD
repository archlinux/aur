pkgname=bytesize-git
pkgver=0.3.0
pkgrel=1
arch=('any')
pkgdesc='Convert between Binary & SI Bytes' 
url='https://github.com/jmdaemon/bytesize'
license=('AGPL')
depends=('logc')
optdepends=()
makedepends=('make')
source=("pkgname::git+https://github.com/jmdaemon/bytesize")
provides=(bytesize)
conflicts=(bytesize)
sha512sums=("SKIP")

build() {
    cd "pkgname"
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    make release lib
    make release bin
}

package-bin() {
    BIN_DIR="$pkgdir"/usr/bin
    mkdir -p $BIN_DIR
    install build/release/bin/bytesize $BIN_DIR/bytesize
}

package-lib() {
    LIB_DIR="$pkgdir"/usr/lib
    mkdir -p $LIB_DIR
    install build/release/lib/libbytesize.so $LIB_DIR/libbytesize.so
}

package() {
    cd "pkgname"
    package-bin
    package-lib
}
