# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='3.6.1'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(openmpi libunwind papi)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(e88435364c31e6de051965a2f23c49be8fdb2afe7542a962c23a35ced3520cfdec308823c4a28f8276ee30eab34708d7e4e7ee8f412740a37e1252d85ea8b356)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure \
        --prefix=/usr \
        --with-mpi=/usr \
        --with-mpi-libs=/usr/lib/openmpi \
        --with-mpi-headers=/usr/include/openmpi \
        --with-unwind=/usr \
        --with-unwind-headers=/usr/include \
        --with-unwind-libs=/usr/lib \
        --without-dyninst \
        --with-papi=/usr \
        --with-papi-headers=/usr/include \
        --with-papi-libs=/usr/lib \

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}