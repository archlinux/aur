# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Generic command line system utilities and reusable C++ header libs"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=('x86_64' 'i686')
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('8eb422818799e4590653a6c9e973418dc95fb5afc4a9dd240b856724d898fbcb') 

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

