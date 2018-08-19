# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=leptonica
pkgname=lib32-leptonica
pkgver=1.76.0
pkgrel=1
pkgdesc="Software that is broadly useful for image processing and image analysis applications (32 bit)"
arch=('x86_64')
url="http://www.leptonica.com/"
license=('custom')
depends=('lib32-giflib' 'lib32-libwebp' 'lib32-openjpeg2' 'leptonica')
source=("$_basename-$pkgver.tar.gz::https://github.com/DanBloomberg/leptonica/archive/$pkgver.tar.gz")
sha256sums=('ff98ffef6103cda0e400676f81113a8157569ac0f453c6e03a1a27b305ba25a7')

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./autobuild

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
