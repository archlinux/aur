# Maintainer: flu

pkgname=sqlcipher
pkgver=3.3.1
pkgrel=1
pkgdesc="SQLite extension that provides transparent 256-bit AES encryption of database files"
arch=('i686' 'x86_64')
url="https://www.zetetic.net/sqlcipher/"
license=('BSD')
makedepends=('openssl' 'sqlite3' 'git')
source=(https://github.com/sqlcipher/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('8bcbe0d46ec109788bf58ba53eaccad189338fb3caf551096ae166c71a72ba58331bc2d1198d6c7b3f62973e004be06c6189f2539e7da664b2e4b50c5637f989')

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
