# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-rrd'
pkgver='2.0.3'
pkgrel='1'
pkgdesc="PHP PECL extension for rrdtool system bindings"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/rrd"
license=('BSD')
depends=('php>=7.0.0' 'rrdtool')
source=("http://pecl.php.net/get/rrd-$pkgver.tgz")
sha256sums=('a42161e58cdc8a853b72cff298989dcbde82b0f76456dd59ce02854c92b730f7')

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
