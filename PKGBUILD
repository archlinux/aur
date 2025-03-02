pkgname=php80-xdebug
_phpbase=80
_extname=xdebug
pkgver=3.4.1
pkgrel=1
pkgdesc="Xdebug is an extension for PHP to assist with debugging and development for php${_phpbase}"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php${_phpbase}")
makedepends=()
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php${_phpbase}/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize${_phpbase}
    ./configure --with-php-config=php-config${_phpbase}
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    install -m0755 -d "$pkgdir/etc/php${_phpbase}/conf.d/"
    install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    echo ";zend_extension=$_extname.so" > "$pkgdir/etc/php${_phpbase}/conf.d/$_extname.ini"
    chmod 0644 "$pkgdir/etc/php${_phpbase}/conf.d/$_extname.ini"
    install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config${_phpbase} --extension-dir)/$_extname.so"
}

sha256sums=('4d96bcded78dbd271fb344c119171b625a8597cd67fc6899ec5e019549f1bb87')
