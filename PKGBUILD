pkgname=sgrep
pkgver=1.94a
pkgrel=1
pkgdesc="SGML/XML query tool for structural pattern matching"
arch=('x86_64')
url="https://www.cs.helsinki.fi/u/jjaakkol/sgrep.html"
license=('GPL-2.0-or-later')
depends=('glibc')
# source=("ftp://ftp.cs.helsinki.fi/pub/Software/Local/Sgrep/${pkgname}-${pkgver}.tar.gz")
source=("https://fossies.org/linux/misc/old/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5b16478e3ab44735e24283d2d895d2c9c80139c95228df3bdb2ac446395faf9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -fi 2>/dev/null || true
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure \
        --prefix=/usr \
        --datadir=/usr/share/$pkgname \
        --mandir=/usr/share/man \
        CFLAGS="-std=gnu89"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
