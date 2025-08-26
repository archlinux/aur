# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_basename=libmpeg2
pkgname=lib32-libmpeg2
pkgver=0.5.1
pkgrel=5
pkgdesc='Library for decoding MPEG-1 and MPEG-2 video streams (32 bit)'
arch=(x86_64)
url='https://libmpeg2.sourceforge.io/'
license=(GPL-2.0-or-later)
depends=(
    lib32-glibc
    libmpeg2
)
source=("https://download.videolan.org/contrib/libmpeg2/$_basename-$pkgver.tar.gz")
b2sums=('29b71740fa601c668a8f5b0a43aa763bda2fc66587f5bff847d4bc6d03dd831abe46428616b770aaaabf2d42877daad8c305ab4dd988cc91a4c90decfcc19c9a')

prepare() {
    cd $_basename-$pkgver

    autoreconf -fi
}

build(){
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --sysconfdir=/etc \
        --localstatedir=/var
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
