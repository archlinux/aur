# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=lib32-libraw
pkgver=0.22.2
pkgrel=2
pkgdesc="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others) (32-bit)"
arch=('x86_64')
url='https://www.libraw.org/'
license=(CDDL-1.0
         LGPL-2.1-only)
depends=(libraw
         lib32-glibc
         lib32-lcms2
         lib32-gcc-libs
         lib32-libjpeg-turbo
         lib32-zlib)
makedepends=(git)
source=("https://www.libraw.org/data/LibRaw-$pkgver.tar.gz")
sha256sums=('de86b035655accff8d4010f1a221fdf50d353cb7b1422ba26f14a0db92612cfa')

build() {
    cd LibRaw-$pkgver

    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"
    export LDFLAGS+=" -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    autoreconf -fiv

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --includedir=/usr/include/libraw32 \
        --disable-examples

    make
}

package() {
    cd LibRaw-$pkgver
    make DESTDIR="$pkgdir" install

    rm -rf -- "${pkgdir:?}/usr/share"
}

