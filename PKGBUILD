# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-solr'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='PHP PECL extension for Apache Solr API'
arch=('i686' 'x86_64')
url='http://pecl.php.net/package/solr'
license=('PHP')
depends=('php>=5.3')
source=("http://pecl.php.net/get/solr-$pkgver.tgz")
sha256sums=('9cf8a067ac79c0e6caa233e38aee9e9bd5d85d3d8cb5c85654ef701aa7cda4bc')

build() {
    cd "$srcdir/solr-$pkgver"
    phpize
    ./configure \
    --prefix=/usr
    make
    echo 'extension=solr.so' > solr.ini
}

package() {
    pushd "$srcdir/solr-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 solr.ini "$pkgdir/etc/php/conf.d/solr.ini"
    popd
}
