pkgname=libbase58
pkgver=0.1.4
pkgrel=1
pkgdesc="C library for Bitcoin's base58 encoding"
arch=(x86_64)
url=https://github.com/luke-jr/libbase58
license=(MIT)
depends=(libgcrypt glibc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/luke-jr/libbase58/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97e8c3387fd4ed90208a8101e658743efbb6e21714e594f0828e6414f92c0b1d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sh autogen.sh
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" make install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
