# Maintainer: Gregor Kralik <g.kralik at gmail dot com>

pkgname=php-legacy-xdebug
_extname=xdebug
pkgver=3.3.1
pkgrel=1
pkgdesc="Xdebug is an extension for PHP, and provides a range of features to improve the PHP development experience. This package provides xdebug for use with php-legacy."
arch=("x86_64")
url="https://xdebug.org/"
license=('custom:Xdebug')
depends=("php-legacy")
makedepends=()
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php-legacy/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize-legacy
    ./configure --with-php-config=php-config-legacy
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    install -m0755 -d "$pkgdir/etc/php-legacy/conf.d/"
    install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    echo ";zend_extension=$_extname.so" > "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
    chmod 0644 "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
    install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config-legacy --extension-dir)/$_extname.so"
}

sha256sums=('4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315')
