# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-solr'
pkgver='2.5.0'
pkgrel='1'
pkgdesc='PHP PECL extension for Apache Solr API'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/solr'
license=('PHP')
depends=('php>=5.3')
source=("http://pecl.php.net/get/solr-$pkgver.tgz")
sha256sums=('f34c6159515bf229a6f72aab374c40d8dfc9c51d74f0d11fe30a611cbdb5c546')

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
