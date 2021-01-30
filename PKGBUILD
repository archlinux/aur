# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libraqm
pkgname=lib32-libraqm
pkgver=0.7.1
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout (32-bit)'
arch=(x86_64)
url='https://github.com/HOST-Oman/libraqm/'
license=(MIT)
depends=(lib32-freetype2 lib32-fribidi libraqm)
source=(https://github.com/HOST-Oman/libraqm/releases/download/v$pkgver/raqm-$pkgver.tar.gz)
sha256sums=('86488cf0b8ac736943fa748bd812000db63cc5ab6ad69c942e68e5187f4b9828')

build() {
    cd raqm-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
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

    rm -rf "$pkgdir/usr/include"
    rm -rf "$pkgdir/usr/share"

    install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
