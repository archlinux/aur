# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=libsrtp0
pkgver=1.6.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/cisco/libsrtp"
license=("BSD")

source=("v$pkgver.tar.gz::https://github.com/cisco/libsrtp/archive/v$pkgver.tar.gz")
md5sums=('0f2188e50468a52cdd51d0479849236a')

prepare() {
    sed -i 's|SHAREDLIBVERSION = 1|SHAREDLIBVERSION = 0|' "$srcdir/libsrtp-$pkgver/Makefile.in"
}

build() {
    cd "$srcdir/libsrtp-$pkgver"
    ./configure --prefix=/usr
    make shared_library
}

package() {
    cd "libsrtp-$pkgver"
    make DESTDIR="$pkgdir/" install
}
