# Maintainer: Nicholas Yim <nickyim05@gmail.com>

extname=event
pkgname="php-$extname"
pkgver='2.5.3'
pkgrel='1'
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.0','libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('0ba2c55071d69e12ee0a8711d974edde47c31176ef1b1576b8fced468bcf918a')

build() {
    cd "$srcdir/$extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr
    make
    echo "extension=sockets" > $extname.ini
    echo "extension=$extname" >> $extname.ini
}

package() {
    pushd "$srcdir/$extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $extname.ini "$pkgdir/etc/php/conf.d/$extname.ini"
    popd
}
