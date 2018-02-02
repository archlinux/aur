# Contributor: Martin C. Doege <mdoege at compuserve dot com>

pkgname='swisseph'
pkgver='2.07.01'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=("http://www.astro.com/ftp/swisseph/swe_unix_src_${pkgver}.tar.gz")
sha256sums=('1d62b26f0ee99fe74713f2590e8b419bdbd6414d01b4c91705b71c642f336956')

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

sha256sums=('3b22a09eb000c48f357b7a947b0a8a9995195e6797ff10a48698f50b3c8aaf8e')
