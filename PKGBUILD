# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
# vim: ft=sh:
realname=PcapPlusPlus
pkgname="${realname,,}"
pkgver=25.05
pkgrel=2
pkgdesc="A multi-platform C++ library for capturing, parsing and crafting of network packets"
arch=("x86_64")
url="https://pcapplusplus.github.io/"
license=('Unlicense')
depends=("libpcap" "zstd")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/seladb/$realname/archive/v$pkgver.tar.gz")
sha256sums=('66c11d61f3c8019eaf74171ad10229dfaeab27eb86859c897fb0ba1298f80c94')

build() {
    cd "$realname-$pkgver" || exit 1
    cmake -B build \
        -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DPCAPPP_BUILD_EXAMPLES=OFF \
        -DPCAPPP_BUILD_TESTS=OFF \
        -DLIGHT_PCAPNG_ZSTD=ON \
        -DPCAPPP_INSTALL=ON \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}

package() {
    cd "$realname-$pkgver" || exit 1
    make DESTDIR=$pkgdir -C build install
}
