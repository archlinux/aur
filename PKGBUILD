# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=libptmalloc3
pkgver=3
pkgrel=1
pkgdesc='A multi-thread malloc and memory pool implementation'
arch=('i686' 'x86_64')
url='http://www.malloc.de/'
license=('custom')

makedepends=(
    make
    gcc
)

source=(
    "$url/malloc/ptmalloc3-current.tar.gz"
    'Makefile.patch'
)
md5sums=(
    c0b9dd5f16f8eae979166dc74b60015c
    1c223c6d09c407d6a971ffb98330f632
)
sha1sums=(
    50b9cd2e0cc0c9bc1856eab19d4051a62195560f
    32c08c9daa7697f0011a99151b376a8035145600
)

prepare() {
    patch 'ptmalloc3/Makefile' Makefile.patch
}

build() {
    make -C 'ptmalloc3' OPT_FLAGS="$CPPFLAGS $CFLAGS $LDFLAGS" linux-shared
}

check() {
    make -C 'ptmalloc3' -k check
}

package() {
    cd 'ptmalloc3'
    install -Dm755 -t "$pkgdir/usr/lib" libptmalloc3.so
    install -Dm644 -t "$pkgdir/usr/lib" libptmalloc3.a
    install -Dm644 -T malloc-2.8.3.h "$pkgdir/usr/include/ptmalloc3.h"
    install -Dm444 -t "$pkgdir/usr/share/licenses/ptmalloc3" COPYRIGHT
}
