# Maintainer: Nicholas Yim <nickyim05@gmail.com>

extname=event
pkgname="php-$extname"
pkgver='2.5.7'
pkgrel='1'
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.3' 'libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('3512d2fab1aee8e37215c83937fbea869a8593e66adcc36400e1ad5a4b657f4a')

build() {
    cd "$srcdir/$extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-event-openssl \
    --with-event-extra \
    --enable-event-sockets
    make
    echo "extension=$extname" > $extname.ini
}

package() {
    pushd "$srcdir/$extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $extname.ini "$pkgdir/etc/php/conf.d/$extname.ini"
    popd
}
