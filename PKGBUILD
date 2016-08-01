pkgname='swisseph'
pkgver='2.05.01'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=("http://www.astro.com/ftp/swisseph/swe_unix_src_${pkgver}.tar.gz")

build() {
    cd "$srcdir/src/"
    make swetest swemini libswe.a libswe.so
}

package() {
    cd "$srcdir/src/"
    install -d -m 755 "$pkgdir/usr/lib"
    install -d -m 755 "$pkgdir/usr/bin"
    install -d -m 755 "$pkgdir/usr/include/swisseph"

    install -m 755 "$srcdir/src/libswe.a" "$srcdir/src/libswe.so" "$pkgdir/usr/lib"
    install -m 755 "$srcdir/src/swetest"  "$srcdir/src/swemini" "$pkgdir/usr/bin/"

    cp *.h "${pkgdir}/usr/include/swisseph"
    rm "${pkgdir}/usr/include/swisseph/swedll.h"
}

sha256sums=('fb7aeb708cb728ab0564528f43b8983775df7c508abfa50533b3207fc6edb53b')
