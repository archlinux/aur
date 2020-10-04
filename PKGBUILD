# Contributor: Martin C. Doege <mdoege at compuserve dot com>

pkgname='swisseph'
pkgver='2.09.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=("http://www.astro.com/ftp/swisseph/swe_unix_src_${pkgver}.tar.gz")
sha256sums=('d9a12ea4454784ed7ddbdaa200a91a8110dd0ea8a96a8532fda2f27be3b71786')

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

