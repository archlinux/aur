# Contributor: Martin C. Doege <mdoege at compuserve dot com>

pkgname='swisseph'
pkgver='2.10.02'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=("http://www.astro.com/ftp/swisseph/swe_unix_src_${pkgver}.tar.gz")
sha256sums=('3d77d408281585833b81a7e68b3d0d9d67d8df49337bee7d0d6d3864690161bf')

build() {
    cd "$srcdir/src/"
    make swetest swemini libswe.a libswe.so CFLAGS="-g -fPIC -ldl -Wall"
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

