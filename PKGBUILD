pkgname=php72-xdebug
_extname=xdebug
pkgver=2.6.1
pkgrel=1
pkgdesc="Xdebug is an extension for PHP to assist with debugging and development"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=('php72')
makedepends=()
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php72/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize72
    ./configure
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    install -m0755 -d "$pkgdir/etc/php72/conf.d/"
    install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    echo ";zend_extension=$_extname.so" > "$pkgdir/etc/php72/conf.d/$_extname.ini"
    chmod 0644 "$pkgdir/etc/php72/conf.d/$_extname.ini"
    install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config72 --extension-dir)/$_extname.so"
}

md5sums=('35cc0f2e8b7d40556a9ad9afd9c49aee')
