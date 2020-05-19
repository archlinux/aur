# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.4.0
pkgrel=2
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
depends=('libpng')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz"
        "${pkgname}-504.patch::https://patch-diff.githubusercontent.com/raw/rednex/rgbds/pull/504.patch")

sha1sums=('1468d4930f50e9512e35fa250a86614bbcf197b9'
          'bcd5f679d5d6775b3fd620b8ffe93fff9cb79cda')

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/${pkgname}-504.patch"
}

build() {
    cd "$srcdir/$pkgname"
    make VERSION_STRING=$pkgver LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr mandir="/usr/share/man" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
