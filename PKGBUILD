pkgname=unmakeself
pkgver=1.1
pkgrel=1
pkgdesc="Makeself archive extractor"
arch=('x86_64')
url="https://www.freshports.org/archivers/unmakeself"
license=('BSD')
makedepends=()
depends=(libarchive)
source=(
    "unmakeself.c::https://raw.githubusercontent.com/freebsd/freebsd-ports/840ecf7efb078240a95c3a107c8f970d15d2482b/archivers/unmakeself/files/unmakeself.c"
    "config.h"
)
sha384sums=('84db14f050c8f40a2d43d396fe20dcd2d10fd91058f293fc26cb66cbc4f0bd64d527171dbf254c2973e7e163b250c5a2'
            'bd62ae4a4a210f441ac196748db37d4a6d59715acf716e7334104728c4df419de15decf80f8b2eb06a4571435aa4871a')

build() {
    cc $CPPFLAGS $CFLAGS -D_GNU_SOURCE=1 $(pkg-config --cflags libarchive) \
        -o unmakeself unmakeself.c $LDFLAGS $(pkg-config --libs libarchive)
}

package() {
    install -D -m755 unmakeself -t "$pkgdir/usr/bin/"
}
