pkgname=php-rrd
pkgver=1.1.3
pkgrel=1
pkgdesc="PHP PECL extension for rrdtool system bindings"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/rrd"
license=('BSD')
depends=('php>=5.3.2' 'rrdtool')
backup=('etc/php/conf.d/rrd.ini')
source=(http://pecl.php.net/get/rrd-$pkgver.tgz)
md5sums=('bde6c50fa2aa39090ed22e574ac71c5a')

build() {
    cd "$srcdir/rrd-$pkgver"
    phpize || return 1
    ./configure --prefix=/usr
    make || return 1
    make INSTALL_ROOT="$pkgdir" install
    echo 'extension=rrd.so' > rrd.ini
    install -D -m644 rrd.ini "$pkgdir/etc/php/conf.d/rrd.ini"
}
