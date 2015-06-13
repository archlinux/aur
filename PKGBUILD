# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=mbelib
pkgver=1.2.5
pkgrel=1
pkgdesc="Voice codecs for P25, ProVoice, Half Rate"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/mbelib"
license=('custom:copyright')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/szechyjs/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('6a609b494a4dfff281a4a6605a3b406f')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir build
    cd build
    cmake ../
    make DEST_BASE="/usr"
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"

    install -d "$pkgdir/usr/lib"
    cp -a libmbe.* "$pkgdir/usr/lib"
    cd ..
    install -Dm644 mbelib.h "$pkgdir/usr/include/mbelib.h"
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
