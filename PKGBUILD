# Maintainer: orumin <dev at orum.in>

_basename=libraqm
pkgname=lib32-libraqm
pkgver=0.3.0
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout (32-bit)'
arch=(x86_64)
url='https://github.com/HOST-Oman/libraqm/'
license=(MIT)
depends=(lib32-freetype2 lib32-fribidi libraqm)
source=(https://github.com/HOST-Oman/libraqm/releases/download/v$pkgver/raqm-$pkgver.tar.gz)
sha256sums=('902592e098c79f8a332d8762dbeb4d277ac3c38ed7666b0f2615f188f2fe3bee')

build() {
    cd raqm-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    ./configure \
        --prefix=/usr \
        --build=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --enable-static=no \
        --enable-shared=yes \
        --enable-fast-install=yes \
        --disable-gtk-doc
    make
}

package() {
    cd raqm-$pkgver
    
    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/share
}
