# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Generic command line system utilities and reusable C++ header libs"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('d4808b200b8a3381279c7241e52001b99336a8af6bad69bb7b4796b622cbc244') 

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

