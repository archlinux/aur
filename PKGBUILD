# Maintainer: Nicholas Yim <nickyim05@gmail.com>

extname=event
pkgname="php-$extname"
pkgver='2.5.6'
pkgrel='1'
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.0','libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('df712bdb2ec89729aa240f6fb6c27739b0a2cae88b497ef7b939ae52ea6d1d9b')

build() {
    cd "$srcdir/$extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-event-openssl \
    --with-event-extra \
    --enable-event-sockets
    make
    echo "extension=$extname" >> $extname.ini
}

package() {
    pushd "$srcdir/$extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $extname.ini "$pkgdir/etc/php/conf.d/$extname.ini"
    popd
}
