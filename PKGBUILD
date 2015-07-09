# Maintainer: flu

pkgname=sqlcipher
pkgver=3.3.0
pkgrel=1
pkgdesc="SQLite extension that provides transparent 256-bit AES encryption of database files"
arch=('i686' 'x86_64')
url="https://www.zetetic.net/sqlcipher/"
license=('BSD')
makedepends=('openssl' 'sqlite3' 'git')
source=(https://github.com/sqlcipher/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('9f24fcd25811aabe36f5e27cdfc117a02ad3578a95691e9b3b7f41ee47ee0c176243c4f35a8415a17a3828d4534aae58a1097b75a950937706b10a79f2c92c81')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr          \
                --disable-tcl          \
                --enable-tempstore=yes \
                  CFLAGS="$CFLAGS -DSQLITE_HAS_CODEC" LDFLAGS="-lcrypto"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
    install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
