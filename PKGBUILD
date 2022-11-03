# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="Generic command line system utilities and reusable C++ header libs"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('4401a50c084c57d131c863be4298c42a6b73135845ad028997a97998fec74d9c') 

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

