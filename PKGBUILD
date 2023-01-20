pkgname=utility-git
pkgver=1.17.0
pkgrel=1
arch=('any')
pkgdesc='General purpose C utility library'
url='https://github.com/jmdaemon/utility'
license=('AGPL3')
depends=('pcre')
optdepends=()
makedepends=('make')
source=("$pkgname::git+https://github.com/jmdaemon/utility")
provides=(utility)
conflicts=(utility)
sha512sums=("SKIP")

build() {
    cd "$pkgname"
    git submodule init
    git submodule update
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    make release lib
}

package-lib() {
    LIB_DIR="$pkgdir"/usr/lib
    INC_DIR="$pkgdir"/usr/include
    mkdir -p $LIB_DIR $INC_DIR
    install build/make/release/lib/libutility.so $LIB_DIR/libutility.so
    install include/utility.h $INC_DIR/utility.h
}

package() {
    cd "$pkgname"
    package-lib
}
