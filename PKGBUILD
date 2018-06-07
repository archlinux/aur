pkgname=php70-solr
pkgver=2.4.0
pkgrel=2
pkgdesc='PHP PECL extension for Apache Solr API'
arch=('x86_64')
url='https://pecl.php.net/package/solr'
license=('PHP')
depends=('php70')
source=("http://pecl.php.net/get/solr-$pkgver.tgz")
sha256sums=('22865dafb76fc5839e84a5bd423bb37d5062883e5dfc4d064b43129ac9f2752c')

build() {
    cd "$srcdir/solr-$pkgver"
    phpize70
    ./configure --prefix=/usr
    make
    echo 'extension=solr.so' > solr.ini
}

package() {
    pushd "$srcdir/solr-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 solr.ini "$pkgdir/etc/php70/conf.d/solr.ini"
    popd
}
