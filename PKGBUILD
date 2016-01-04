# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-solr'
pkgver='2.3.0'
pkgrel='1'
pkgdesc='PHP PECL extension for Apache Solr API'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/solr'
license=('PHP')
depends=('php>=5.3' 'php<7.0')
source=("http://pecl.php.net/get/solr-$pkgver.tgz")
sha256sums=('d90db2ea0a32b8190d65d931e144c01f6238e95e1b91f9d38ddcb2bf68aad7a0')

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
