# Maintainer: Alex Grabowsksi <hurufu@gmail.com>

pkgname=libshm_arena
pkgver=0.0.25
pkgrel=1
pkgdesc="It's an inter-process shared memory allocator"
arch=(x86_64)
url=https://shm-arena.sourceforge.net/
license=(LGPL)
makedepends=(make gcc automake-1.14 doxygen)
provides=(libshm_arena.so=6.0.1)
source=(
    "https://downloads.sourceforge.net/project/shm-arena/shm_arena-RC-$pkgver.tar.bz2"
)
md5sums=(
    7d76d5c378a8886662f55b03876a6add
)

prepare() {
    patch -p1 -d "shm_arena-RC-$pkgver" < ../00-fix-doc-install-target.patch
}

build() {
    cd "shm_arena-RC-$pkgver"
    ./configure --prefix=/usr --enable-debug --enable-spew=INFO
    make
}

package() {
    make -C "shm_arena-RC-$pkgver" DESTDIR="$pkgdir/" install
    mkdir -p -- "$pkgdir/usr/share/doc" "$pkgdir/usr/share/examples"
    mv -- "$pkgdir/usr/share/shm_arena/doc" "$pkgdir/usr/share/doc/shm_arena"
    mv -- "$pkgdir/usr/share/doc/shm_arena/examples" "$pkgdir/usr/share/examples/shm_arena"
    ln -sf ../../../examples/shm_arena "$pkgdir/usr/share/doc/shm_arena/html/examples"
}
