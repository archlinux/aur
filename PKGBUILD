# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=libsrtp0
pkgver=1.6.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/cisco/libsrtp"
license=("BSD")

pkgdesc='provides an implementation of the Secure Real-time Transport Protocol (SRTP), compatible with 0th version of lib'

source=("v$pkgver.tar.gz::https://github.com/cisco/libsrtp/archive/v$pkgver.tar.gz" "LICENSE::https://raw.githubusercontent.com/cisco/libsrtp/master/LICENSE")
md5sums=('0f2188e50468a52cdd51d0479849236a' '2909fcf6f09ffff8430463d91c08c4e1')
depends=("glibc")
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
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
