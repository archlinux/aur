# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libaec
pkgname=lib32-libaec
pkgver=1.0.4
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (32-bit)"
arch=(x86_64)
url=https://gitlab.dkrz.de/k202009/libaec/
license=(custom)
depends=(lib32-glibc libaec)
makedepends=(cmake)
_md5=ea0b7d197a950b0c110da8dfdecbb71f
source=("$url/uploads/$_md5/$_basename-$pkgver.tar.gz")
sha256sums=('f2b1b232083bd8beaf8a54a024225de3dd72a673a9bcdf8c3ba96c39483f4309')

prepare() {
    mkdir -p build
}

build() {
    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake ../$_basename-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32

    make
}

package() {
    cd build

    make DESTDIR="$pkgdir" install

    install -Dm644 ../${_basename}-${pkgver}/Copyright.txt -t "${pkgdir}/usr/share/licenses/$pkgname"

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
