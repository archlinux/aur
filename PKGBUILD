# Maintainer: Luke Arms <luke@arms.to>

pkgname=php-ibm_db2
_extname=${pkgname#php-}
pkgver=2.2.2
pkgrel=1
pkgdesc='Extension for IBM DB2 Universal Database, IBM Cloudscape, and Apache Derby'
arch=('x86_64')
url='https://github.com/php/pecl-database-ibm_db2'
license=('Apache')
depends=('php' 'db2-odbc-cli')
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('d23a503e0a8c4928e512d14e253db1cdaef0d7493d174fc87bfa6938e9a3a29e')
backup=("etc/php/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize
    ./configure --prefix=/usr --with-IBM_DB2=/opt/db2-odbc-cli
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo "extension=$_extname.so" >"$srcdir/$_extname.ini"
    install -Dm0644 "$srcdir/$_extname.ini" "$pkgdir/etc/php/conf.d/$_extname.ini"
    install -Dm0644 "$srcdir/$_extname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
