# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=libsocket
pkgver=2.5.0
pkgrel=1
pkgdesc='Library with a C part and a C++ part making sockets usage easy and clean'
arch=('i686' 'x86_64')
url='http://dermesser.github.io/libsocket/doc/'
license=('BSD-2-Clause')

makedepends=(
    git
    cmake
)
provides=(
    libsocket
    libsocket++.so=libsocket++.so-64
    libsocket.so=libsocket.so-64
)

source=("https://github.com/dermesser/$pkgname/archive/v$pkgver.tar.gz")
md5sums=(43a38b76b7fa5387147d1589c5314e03)
sha1sums=(3dc272e01830357c64af888bb084be87493ef795)
sha256sums=(0afe2ece985caa0b44546d10426b15a506164d5b96d7242890c7d0337f479689)

build() {
    mkdir -p "libsocket-$pkgver/build"
    cd "libsocket-$pkgver/build"
    cmake \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_STATIC_LIBS=ON \
        ..
    make
}

package() {
    make -C "libsocket-$pkgver/build" DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/libsocket-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/libsocket/LICENSE"
    mkdir -p "$pkgdir/usr/share/doc/libsocket"
    cp -rt "$pkgdir/usr/share/doc/libsocket" "$srcdir/libsocket-$pkgver"/examples*
}
