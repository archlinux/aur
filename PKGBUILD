# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libaec
pkgname=lib32-libaec
pkgver=1.0.2
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (32-bit)"
arch=('x86_64')
url='https://gitlab.dkrz.de/k202009/libaec/'
license=('custom')
depends=('lib32-glibc' 'libaec')
makedepends=('cmake')
_md5=b30adc1abf805d7454896ab83c900eb8
source=("$url/uploads/$_md5/$_basename-$pkgver.tar.gz")
sha256sums=('024722866eb859bf926d6f9cb20edd3f26e80a1bdbea1889e9235d5eca3106d0')

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

    install -Dm644 "$srcdir/$_basename-$pkgver/Copyright.txt" -t "$pkgdir/usr/share/licenses/$pkgname"

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
