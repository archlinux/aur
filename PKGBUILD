# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Generic command line system utilities and reusable C++ header libs"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('2a7840428046f9b0042e77f5ae803883d0fc71f6ed4caa665efa7b33c6ee5fa5') 

build() {
    cd "$srcdir/$pkgname"
    cmake \
        -DCMAKE_INSTALL_FULL_SYSCONFDIR:PATH=/etc \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" make install
    strip "$pkgdir"/usr/bin/*
}

