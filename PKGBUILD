# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-rrd'
pkgver='2.0.0'
pkgrel='1'
pkgdesc="PHP PECL extension for rrdtool system bindings"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/rrd"
license=('BSD')
depends=('php>=7.0.0' 'rrdtool')
source=("http://pecl.php.net/get/rrd-$pkgver.tgz")
sha256sums=('b6dd68414cd9ce73fc487873b3feeecd4aac8f1b5bebece91c33fa3023a80ffd')

build() {
    cd "$srcdir/rrd-$pkgver"
    phpize
    ./configure \
    --prefix=/usr
    make
    echo 'extension=rrd.so' > rrd.ini
}

package() {
    pushd "$srcdir/rrd-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 rrd.ini "$pkgdir/etc/php/conf.d/rrd.ini"
    popd
}
