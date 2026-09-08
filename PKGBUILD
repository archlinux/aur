# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=lib32-libspectre
pkgver=0.2.12
pkgrel=1
pkgdesc='Small library for rendering Postscript documents'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://www.freedesktop.org/wiki/Software/libspectre'
depends=(libspectre
         lib32-ghostscript
         lib32-glibc)
source=(https://libspectre.freedesktop.org/releases/libspectre-$pkgver.tar.gz{,.sig})
sha256sums=('55a7517cd3572bd2565df0cf450944a04d5273b279ebb369a895391957f0f960'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7) # Albert Astals Cid <aacid@kde.org>


build() {
    cd libspectre-$pkgver

    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"
    export LDFLAGS+=" -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-gtk-doc \
        --disable-test \
        --disable-static

    make
}

package() {
    cd libspectre-$pkgver
    make DESTDIR="$pkgdir" install

    rm -rf -- "${pkgdir:?}/usr/share"
    rm -rf -- "${pkgdir:?}/usr/include"
}

