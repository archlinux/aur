# Maintainer: Nicholas Yim <nickyim05@gmail.com>

extname=event
pkgname="php-$extname"
pkgver='2.5.5'
pkgrel='1'
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.0','libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('59b723c329ff9591c1421bd44d16fe9a0840b804dfc901a9a0961d3c41139d33')

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
