pkgname=php81-xdebug
_phpbase=81
_extname=xdebug
pkgver=3.2.0
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
sha256sums=('7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7')

