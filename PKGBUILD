# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=leptonica
pkgname=lib32-leptonica
pkgver=1.80.0
pkgrel=1
pkgdesc="Software that is broadly useful for image processing and image analysis applications (32 bit)"
arch=('x86_64')
url="http://www.leptonica.com/"
license=('custom')
depends=('lib32-giflib' 'lib32-libwebp' 'lib32-openjpeg2' 'leptonica')
source=("$_basename-$pkgver.tar.gz::https://github.com/DanBloomberg/leptonica/archive/$pkgver.tar.gz")
sha256sums=('3952b974ec057d24267aae48c54bca68ead8275604bf084a73a4b953ff79196e')

prepare() {
    cd $_basename-$pkgver

    ./autogen.sh
}


build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    install -Dm644 leptonica-license.txt "$pkgdir/usr/share/licenses/$pkgname/leptonica-license.txt"

    cd "$pkgdir/usr"

    rm -r bin include
}
