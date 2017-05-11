# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-rrd'
pkgver='2.0.1'
pkgrel='1'
pkgdesc="PHP PECL extension for rrdtool system bindings"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/rrd"
license=('BSD')
depends=('php>=7.0.0' 'rrdtool')
source=("http://pecl.php.net/get/rrd-$pkgver.tgz")
sha256sums=('39f5ae515de003d8dad6bfd77db60f5bd5b4a9f6caa41479b1b24b0d6592715d')

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
